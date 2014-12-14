package com.shengli.grinder.io.input

import java.io.File
import scala.collection.JavaConversions._
import scala.collection.mutable.ArrayBuffer
import scala.util.control.Breaks._
import scala.util.matching.Regex
//import com.shengli.dw.hdfsfile.HdfsFileUtil
import com.shengli.grinder.entity.HDFSFileType
import com.shengli.grinder.entity.SeqLzoHDFSFile
import com.shengli.grinder.entity.SeqLzoHDFSFile
import com.shengli.grinder.utils.Logging
import akka.actor.ActorSystem
import com.shengli.grinder.entity.TextHDFSFile
import akka.actor.Props
import com.shengli.grinder.actors.SeqLzoFileDecompressor
import com.shengli.grinder.entity.StartFileDeCompress
import akka.actor.Actor

abstract class InputSource(path: String) extends Logging {
  //return the list of file path
  def getInputSource() : List[String]
  
}

/** 
* @ClassName: LocalInputSource 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:15  
*/ 
class LocalInputSource(dir: String) extends InputSource(dir: String) {
	
  override def getInputSource():  List[String]  = {
    
    val file = new File(dir)
    
    val list = file.isDirectory() match {
      //not support nested directories
      case true => 
        var lst = new ArrayBuffer[String]
        file.listFiles().foreach{ff=>
          lst += ff.getAbsolutePath()
        }
        lst.toList
        
      case false =>
        List(dir)
    }
    list
  }
}

 
/** 
* @ClassName: HDFSInputSource 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:07  
*/ 
//class HDFSInputSource(dir: String, file_type: HDFSFileType , system: ActorSystem) extends InputSource(dir: String) {

  //note hdfs input source must be a directory contains reading files
//  override def getInputSource() : List[String] = {
//    
//     val final_iters = new ArrayBuffer[String]();
//    
//     logInfo("dir is =>"+dir)
//     
//     //This original implementation is to decompress one 
//     //Original implementaition -> val ls = HdfsFileUtil.getFileList(dir)
//     
//     val original_ls = HdfsFileUtil.getFileList(dir)
//     
//     original_ls.toList
     //This will decompress the lzo seq file first to a text file in a temp path. 
//     file_type match {
//     	  case file_type: SeqLzoHDFSFile => 
//     	  	handleSeqLzoHDFSFile(original_ls.toList)
//     	  	
//     	  case file_type: TextHDFSFile => ???
//     	    
//     	}
//     not support stream combination in sequencefile since the hadoop sequence api not support
//     val input = new FileInputStream(new File(""))
//     val lineIterator =  scala.io.Source.fromInputStream(input).getLines
     
//   This will cause oom exception, since reading each file then append to only one iterator.     
//     ls.foreach{ path =>
//       logInfo(path)
//       val it = HdfsFileReader.context(path)
//       final_iters ++= it
//     }
//     logInfo("final iterator is " + final_iters) 
     
     //convert to sacala iterator
//     val scala_itr = asScalaIterator(final_iters.iterator) 
//     scala_itr
//  }
  
  
//  def handleSeqLzoHDFSFile(original_ls: List[String]) {
//     var count = 0
//     val rs = original_ls.foreach{o_path =>
//     	val decompressor =  system.actorOf(Props[SeqLzoFileDecompressor].withDispatcher("my-pinned-dispatcher"), "seqLzoFileDecompressorActor_"+count)
//     	decompressor ! StartFileDeCompress(o_path)
//     	count += 1
//     }
//  }

//}

/*------------------------Facotry------------------------*/

/**
 * file:///app/home/hadoop/
 * hdfs://localhost:9000/dw/etl/ff14
 */

/** 
* @ClassName: InputSourceFactory$ 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:00  
*/ 
object InputSourceFactory {
  
	def getInputSources(path: String, system: ActorSystem) = {
	  
	    val hdfs_pattern = """hdfs://""".r
	    
	    var matchList =  new  ArrayBuffer[Regex] ()
	    matchList += hdfs_pattern
	    
	    var fType = ""
	   
	    breakable {
	    	matchList.foreach { regex=>
		      val rs = regex.findFirstMatchIn(path)
		      if(rs.getOrElse("") != "") {
		        fType = rs.get.toString
		        break
		      }
		    }
	    }
	    
	    
	    fType match {
//	      case "hdfs://" =>
//	        val file_type = new SeqLzoHDFSFile
//	        new HDFSInputSource(path, file_type, system).getInputSource
//	      
	      case "" =>
	        new LocalInputSource(path).getInputSource
	        
	      case _ =>
	        throw new UnsupportedOperationException("UnSupport file format found!")
	    }
	    
	}
} 
