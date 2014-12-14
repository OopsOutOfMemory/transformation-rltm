package com.shengli.grinder.driver

import scala.collection.mutable.ArrayBuffer
import scala.collection.mutable.HashSet
import scala.collection.mutable.ListBuffer
import org.json4s.JsonAST.JObject
import org.json4s.jackson.JsonMethods.parse
import org.json4s.jvalue2extractable
import org.json4s.jvalue2monadic
import org.json4s.string2JsonInput
import akka.actor.ActorRef
import akka.actor.ActorSystem
import akka.actor.Props
import akka.actor.actorRef2Scala
import com.shengli.grinder.actors.LocalFileWriterActor
import com.shengli.grinder.entity.Line
import com.shengli.grinder.actors.LocalFileReaderActor
import com.shengli.grinder.strategy.Rule
import com.shengli.grinder.strategy.OneToOneOutputStrategy
import com.shengli.grinder.strategy.SingleValueStrategy
import com.shengli.grinder.strategy.OneToManyOutputStrategy
import com.shengli.grinder.strategy.RegexMutipleStrategy
import com.shengli.grinder.strategy.CommonStrategy
import com.shengli.grinder.strategy.RegexStrategy
import com.shengli.grinder.strategy.FieldDesc
import com.shengli.grinder.ds.MysqlDataSource
import com.shengli.grinder.ds.MysqlDatabase
import com.shengli.grinder.mapping.LogRulesMapping
import com.shengli.grinder.io.input.LocalInputSource
import com.shengli.grinder.io.input.InputSourceFactory
import com.shengli.grinder.strategy.Resolver
import com.shengli.grinder.utils.PropsUtil


case class Meat(rule_exp : String, log_name : String, rule : Rule)

/** 
* @ClassName: GrinderApplication$ 
* @Description: TODO
* @author shengli.victor 盛利
*/ 
object GrinderApplication {
  
  def main(args: Array[String]) {
    val dateString = args(0)
    val app = args(1)
	val input_path =  args(2)
	val output_path =  args(3)
		
	val _system = ActorSystem("transformation-rltm-system")
	val readList = InputSourceFactory.getInputSources(input_path, _system)
	//Many Meat need to be grind
	val initializer = new Initializer(_system)
	//start process
	lazy val tuples = initializer.init
	lazy val allRules = tuples._1
	lazy val meatModelList = tuples._2
	lazy val unique_logs = tuples._3
	
	initializer.initialMappingRelations(app)
	
	val resolver = new Resolver()
	val outputHandler = new OutPutHandler(app, initializer, resolver)
    
    println("start reading.")
    
    //0 prepare writer
    val actorWriterList =  initializer.initializeWriterActors(output_path, unique_logs)
    //1 prepare processors
    val number_processor = PropsUtil.get("grinder.processor.number")
    val processors = initializer.initialProcessor(number_processor.toInt, meatModelList, outputHandler)
    //2 start readding
	val actorReaderList = initializer.initializeReaderActor(readList)
	println("finished.")
  }
}
//	readerActor ! PoisonPill 
//}