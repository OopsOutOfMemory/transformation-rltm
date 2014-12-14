package com.shengli.grinder.driver

import com.shengli.grinder.utils.Logging
import org.json4s.JsonAST.JObject
import org.json4s.jackson.JsonMethods.parse
import org.json4s.jvalue2extractable
import org.json4s.jvalue2monadic
import org.json4s.string2JsonInput
import com.shengli.grinder.strategy.OneToOneOutputStrategy
import scala.collection.mutable.ArrayBuffer
import com.shengli.grinder.mapping.LogRulesMapping
import com.shengli.grinder.strategy.OneToManyOutputStrategy
import org.json4s.JsonAST.JObject
import com.shengli.grinder.strategy.FieldDesc
import com.shengli.grinder.ds.MysqlDatabase
import scala.collection.mutable.HashSet
import com.shengli.grinder.strategy.Rule
import akka.actor.ActorRef
import akka.actor.ActorSystem
import akka.actor.Props
import com.shengli.grinder.actors.LocalFileWriterActor
import scala.collection.mutable.ListBuffer
import com.shengli.grinder.strategy.Resolver
import com.shengli.grinder.entity.Line
import java.io.File
import java.io.IOException
import com.shengli.grinder.actors.HDFSFileReaderActor
import com.shengli.grinder.actors.LocalFileReaderActor
import com.shengli.grinder.actors.ProcessorActor
import com.shengli.grinder.utils.PropsUtil
import scala.collection.mutable.HashMap
import com.shengli.grinder.actors.KafkaReaderActor

/** 
* @ClassName: Initializer 
* @Description: TODO
* @author shengli.victor 盛利
*/ 
class Initializer(system: ActorSystem) extends Logging {
    val mysqlDb = new MysqlDatabase
    val ruleExecutor = new RuleExecutor()
  
	def init() = {
	  //load mappings, load field rules, initial actors
	  //transform rules which load from database or files from json format to objects
	  val records = mysqlDb.query("select rule_content from meta_rule")
	  
	  var allRules: ArrayBuffer[Rule]  = new ArrayBuffer[Rule]()
	  
	  while(records.next()) {
	    val content = records.getString("rule_content")
	    val listrules = ruleExecutor.loadRules(content) 
	    allRules ++=   listrules
	  }
	  
	  //transform rules to rule_exp, log_name, rule, main transform to object
	  val meatModelList = ruleExecutor.formatRuleLog(allRules)
	  
	  //get the  unique log_name, so we can create file handler to write to.
	  val unique_logs = uniqueLogs(List("ff14"))
	  
	  (allRules, meatModelList, unique_logs)
	  
	}
    
    def initialMappingRelations(app_name: String): Unit = {
      var mapping = new HashMap[String,String]
      val records = mysqlDb.query("select m_key,m_value from app_mapping where app_name='"+app_name+"' ")
      while(records.next()) {
	    val k = records.getString("m_key")
	    val v = records.getString("m_value")
	    mapping += (k->v)
	  }
      mapping.foreach{
        case (k,v) => PropsUtil.set(k, v)
      }
    } 
	
	def uniqueLogs(apps : List[String]) = {
	    val set = new HashSet[String]
	    apps.foreach{app=>
	      val rlmp = ruleExecutor.getRuleLogMapping(app)
	      rlmp.valuesIterator.foreach{
	      set += _
	      }
	    }
	    set foreach println
	    set.to[scala.collection.mutable.ArrayBuffer]
	}
	
	def formatWriterActorName(path: String) : String = {
	  path.substring(path.lastIndexOf("/")+1, path.length())
	}
	
	def formatReaderActorName(path: String) : String = {
//	  var new_path = path.replaceAll("/", "_")
//	  new_path = new_path.replaceAll("\\\\", "_")
//	  new_path = new_path.replaceAll(":", "_")
//	  new_path +="_reader"
//	  new_path
	  path
	}
	
	def formatProcessorActorName(no: String) : String = {
	  var new_path = "processor_"+no
	  new_path
	}
	
	
   /**
     * Writer Actors
	 * @param system
	 * @param output_path
	 * @return actor writers
 */
	def initializeWriterActors(output_path : String, logs: ArrayBuffer[String]) : ArrayBuffer[ActorRef] =  {
	      initialDirs(output_path)
	      var writers = new ArrayBuffer[ActorRef]()
	      val paths = initialLogs(output_path, logs)
	      val writeType = PropsUtil.get("grinder.write.filetype")
	      paths foreach { path =>
	//	  writers += _system.actorOf(Props(new FileWriterActor(log+".txt")), name = log).asInstanceOf[FileWriterActor]
	      val act_name = formatWriterActorName(path)
	      writeType match {
	        case "local" =>
	        	writers += system.actorOf(Props(new LocalFileWriterActor("%s".format(path)) ), name = act_name)
	        case "hdfs" =>
	            //TODO: to implement a hdfs file write actor
	            writers += system.actorOf(Props(new LocalFileWriterActor("%s".format(path)) ), name = act_name)
	      }
		  
//		  logInfo("create writer -> %s success".format(act_name))
		}
	    writers  
	}
	
	def initialProcessor(num: Int, meatModelList: ArrayBuffer[com.shengli.grinder.driver.Meat], outputHandler: OutPutHandler) {
	     var processors = new ArrayBuffer[ActorRef]()
	     for(i <- 0 until num) {
	        val act_name = formatProcessorActorName(i.toString)
		    processors += system.actorOf(Props(new ProcessorActor(meatModelList, outputHandler) ), name = act_name)
//		    logInfo("create processor -> %s success".format(act_name))
	     }
	    processors  
	}
	
    def initializeReaderActor(readList : List[String]) : ArrayBuffer[ActorRef] = {
	  
	  var readers = new ArrayBuffer[ActorRef]()
	  
	   val act_name = formatReaderActorName("single_reader")
	   val readType = PropsUtil.get("grinder.read.filetype")
	   
	   readType match {
	        case "local" =>
	          readers += system.actorOf(Props(new LocalFileReaderActor(readList) ), name = act_name)
	        case "hdfs" =>
	          readers += system.actorOf(Props(new HDFSFileReaderActor(readList) ), name = act_name)
	        case "kafka" =>
	          readers += system.actorOf(Props(new KafkaReaderActor() ), name = act_name)
	      }
//	  readList.foreach{path=> 
//	     val act_name = formatReaderActorName(path)
//	    readers += system.actorOf(Props(new HDFSFileReaderActor("%s".format(path)) ), name = act_name)
//	    logInfo("create reader -> %s success".format(act_name))
//	  }
	  readers
	}

	
	def initialLogs(output_path:String, logs: ArrayBuffer[String]) =  {
	   val rs = logs.map(output_path + "/" + _)
	   rs
	}
	
	
	/**
	 * check the output dir is exist or not
	 * @param output_path
	 * @return
	 */
	def initialDirs(output_path: String) {
	  val dir = new File(output_path)
	  if(dir.exists()) {
	    throw new IOException("output dir is already exists!")
	  }
	  else {
	    if (!dir.mkdirs()) throw new RuntimeException("Error creating local dirs.") 
	  }
	}
	
    //print all writers path
    def printAllWriters(writers: ArrayBuffer[ActorRef]) {
		writers.foreach(w=>println(w.path))
    }
	
    //find a specific writer by log_name
    def sendToWriter(log_name : String) = {
	   val ur_actor = system.actorFor("/user/"+log_name)
	   ur_actor
	}
  
}


class RuleExecutor extends Logging {
  
    def loadRules(ruleContent : String) = {
	  val ruleList = parseRules(ruleContent)
	  ruleList
	}
	
	def getRuleLogMapping (app : String) = {
	  val rule_log_map = LogRulesMapping.mappings.get(app).get
	  rule_log_map
	}
	
	/*
	 *This function perform a Meat as (rule_exp, log_name, rule: Rule, opt: outputStrategy) so we can extract
	 * 
	 */
	def formatRuleLog(ruleList : ArrayBuffer[Rule]) : ArrayBuffer[Meat] = {
	     val tupleList = ArrayBuffer[Meat]()
	     ruleList.foreach { rule=>
	          val rule_log_mapping = getRuleLogMapping(rule.app_name)
	          val log_name = rule_log_mapping.get(rule.rule_expression).get
	          tupleList += new Meat(rule.rule_expression, log_name, rule)
	     }  
	     tupleList
	}
	/*
	 * pase a json desc to a rule object
	 */
	def parseRules(ruleContent : String) = {
	  //should do this to make json4s avaliable
	  implicit val formats = org.json4s.DefaultFormats
//	  val jsonSrc = scala.io.Source.fromFile(rulePath).getLines.mkString;
	  val json = parse(ruleContent)
	  var ruleList : ArrayBuffer[Rule] = ArrayBuffer[Rule]()
      val app_name = (json \ "app_name").extract[String]
	  val rule_exp = (json \ "rule_expression").extract[String]
	  val fieldList = (json \ "fields_desc").extract[List[FieldDesc]]
      val output = (json \ "output_strategy").extract[JObject]
      val out_put_strategy_name = (output \ "name").extract[String]
      val output_strategy = out_put_strategy_name match {
        case "one2one"=>
          new OneToOneOutputStrategy(out_put_strategy_name)
        case "one2many"=>
          val iterate_field = (output \ "iterate_fields").extract[String]
          new OneToManyOutputStrategy(out_put_strategy_name, iterate_field)
      }
	  fieldList foreach println
	  val rule = new Rule(app_name, rule_exp,fieldList,output_strategy)
	  ruleList+=rule
	  ruleList
	}
  
}


class OutPutHandler(val app: String, val initializer: Initializer, val resolver:Resolver) extends Logging {
  
   def handleOneToManyOutput(rule : Rule, line : String, output_strategy : OneToManyOutputStrategy) {
       val fieldList = new ListBuffer[String]()
       val newFieldList = new ListBuffer[String]()
       val iter_keys  =  output_strategy.iterate_fields.split(",",-1)
       var iter_size = 0
       rule.fieldList.foreach{field=>
        val rsField = resolver.resolveField(line, field)
        if(iter_keys.exists(e=>e.equals(field.fieldName))) iter_size=rsField.split(",",-1).size else iter_size
        fieldList += rsField
      }
       
      for(i <- 0 until fieldList.size) {
        if(fieldList(i).split(",",-1) != iter_size ) {
          var tempList = new ListBuffer[String]()
          val current = fieldList(i)
          for(j <- 0 until iter_size) {
            tempList += current
          }
          newFieldList += tempList.mkString(",")
        }
        else{
           newFieldList += fieldList(i)
        }
      }
      
      val log_name = initializer.ruleExecutor.getRuleLogMapping(app).get(rule.rule_expression).get
      
      for(i <- 0 until iter_size) {
        var list = new ListBuffer[String]()
        for(k <- 0 until newFieldList.size ) {
          list += newFieldList(k).split(",",-1)(i)
        }
        initializer.sendToWriter(log_name) ! Line(formatOutPut(list))
      }
         //we assume the one to many have the same size
   }
   
   
   /*
    * normal output strategy, one long write to one line
    * */
   def handleOneToOneOutput(rule : Rule, line : String, output_strategy : OneToOneOutputStrategy) {
       val fieldList = new ArrayBuffer[String]()
       val start = System.nanoTime()
       rule.fieldList.foreach{field=>
        val rsField = resolver.resolveField(line, field)
        fieldList+=rsField
      }
      val end = System.nanoTime()
      val time = (end - start) 
//      logInfo("resolver fields  using -> "+time + " ns"  )
      
      val log_name = initializer.ruleExecutor.getRuleLogMapping(app).get(rule.rule_expression).get
      
       initializer.sendToWriter(log_name) ! Line(formatOutPut(fieldList))
   }
  
   
   def formatOutPut(fieldList : Seq[String] ) : String = {
     fieldList.mkString("\t")
   }
}