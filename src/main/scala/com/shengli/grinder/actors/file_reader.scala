package com.shengli.grinder.actors


import akka.actor.Actor
import com.shengli.grinder.entity.Line
import com.shengli.grinder.utils.Logging
//import com.shengli.dw.hdfsfile.HdfsFileReader
import scala.collection.JavaConversions._
import com.shengli.grinder.utils.PropsUtil
import akka.actor.ActorRef
import com.shengli.grinder.driver.OutPutHandler
import scala.collection.mutable.ArrayBuffer
import akka.actor.Props
import scala.util.Random
import com.shengli.grinder.entity.ReadFile
import com.shengli.grinder.entity.FinishFileDecompress
import kafka.consumer.Consumer
import kafka.consumer.ConsumerConfig
import java.util.Properties
import java.util.concurrent.Executors
import scala.collection.JavaConverters._

class BaseFileReaderActor extends Actor with Logging {
  
  def receive : Receive = {
	  // do nothing, TODO: need recieve ack ?
	  case _ => 
	}
  
  //return the process' path
   def chooseProcessor() : ActorRef = {
       val number_processor = PropsUtil.get("grinder.processor.number").toInt
       val number = scala.util.Random.nextInt(number_processor)
       val processor = this.context.system.actorFor("/user/processor_"+number)
       processor
   }
}



class KafkaReaderActor() extends BaseFileReaderActor {
  override def preStart(): Unit = {
    var props = new Properties();  
		props.put("zookeeper.connect", PropsUtil.get("grinder.kafka.consumer.zookeeper"));  
		props.put("zookeeper.connectiontimeout.ms", PropsUtil.get("grinder.kafka.consumer.zookeeper.connectiontimeout.ms"));  
		props.put("group.id", PropsUtil.get("grinder.kafka.consumer.group.id"));  
 
	    // Create the connection to the cluster  
		var consumerConfig = new ConsumerConfig(props);  
		var connector = Consumer.createJavaConsumerConnector(consumerConfig);  
		val topic = PropsUtil.get("grinder.kafka.consumer.group.id")
 
	    var topics = new java.util.HashMap[String,Integer]();  
	    topics.put(topic, 2);  
		
	    var topicMessageStreams = connector.createMessageStreams(topics);  
	    var streams = topicMessageStreams.get(topic);
	    var threadPool = Executors.newFixedThreadPool(2);
	    for ( stream <- streams.asScala) {  
	    	threadPool.submit(new Runnable() {  
                override def run() {  
                    for ( msgAndMetadata <- stream) {  
                        // process message (msgAndMetadata.message())  
                        System.out.println("topic: " + msgAndMetadata.topic);  
                        var message =  msgAndMetadata.message;  
//                        var buffer = message.payload;  
//                        var bytes = new byte[message.payloadSize];  
//                        buffer.get(bytes);
//                        String tmp = new String(bytes);
                        System.out.println("message content: " + new String(message));  
                    }  
                }  
            });  
        }    
  }
}


/** 
* @ClassName: FileReaderActor 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:33  
*/ 
class LocalFileReaderActor(readList: List[String]) extends BaseFileReaderActor {

    //each reader actor get a file from fileList of InputSources
    override def preStart(): Unit = {
       readList.foreach(readFileAndProcess(_))
    }
    
    override def receive : Receive = {
//      case FinishFileDecompress(file_path) => 
//        readFileAndProcess(file_path)
      
      case _ => new UnsupportedOperationException("Unknown Message found in file reader!")
        
    }
    
    def readFileAndProcess (path: String) = {
          val lines = scala.io.Source.fromFile(path).getLines
	      val processor = chooseProcessor()
	     
	      lines.foreach{line=>
	        //send to a processor
	        val start = System.nanoTime()
	      	processor ! Line(line)
	      	val end = System.nanoTime()
	      	val time = (end - start) / 1000000000
//	      	logInfo("read one line using -> "+time + "ns")
	      }
          logInfo("reading files done!")
    }
  
	override def postStop(): Unit = {
    }
}



class HDFSFileReaderActor(readList: List[String]) extends BaseFileReaderActor { 
  var count = 0		
  override def preStart(): Unit = {
    readList.foreach(readHDFSFileAndProcess(_))
    logInfo("no file to read any more.")
  }
  

   override def receive : Receive = {
//	  case FinishFileDecompress(file_path) =>
//        readHDFSFileAndProcess(file_path)
//      
      case _ => new UnsupportedOperationException("Unknown Message found in file reader!")
	}
  
  def readHDFSFileAndProcess (path: String) = {
//          logInfo("begin to read -> " + path)
//	      val lines =   HdfsFileReader.context(path).iterator()
//	      val s_iter = asScalaIterator(lines)
//	      val processor = chooseProcessor()
//	      lines.foreach{ line=>
//	        val start = System.nanoTime()
//	        //send to a processor
//	      	processor ! Line(line)
//	      	val end = System.nanoTime()
//	      	val time = (end - start)
//	      	if(count % 100000 == 0) { 
//	      	logInfo("current total read count is ->" + count)
//	      	}
//	      	count = count + 1
//	      }
//          logInfo("end reading -> "+path)
//          logInfo("current read count "+count)
    }
}