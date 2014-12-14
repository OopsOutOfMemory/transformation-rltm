package com.shengli.grinder.actors

import akka.actor.Actor
import java.io.FileOutputStream
import java.nio.ByteBuffer
import java.nio.channels.FileChannel
import java.io.File
import com.shengli.grinder.entity.Line
import com.shengli.grinder.utils.Logging
import java.io.FileWriter


 
/** 
* @ClassName: BaseFileActor 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:37  
*/ 
abstract class BaseFileWriterActor(path: String) extends Actor with Logging {
}




/** 
* @ClassName: HDFSFileWriterActor 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年12月10日 下午5:23:34  
*/ 
//class HDFSFileWriterActor(target: String) extends BaseFileWriterActor(target) {
//  
//}
 
/** 
* @ClassName: LocalFileWriterActor 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:41  
*/ 
class LocalFileWriterActor(target: String) extends BaseFileWriterActor(target)  {
    var count = 0
    var fw : FileWriter = _
    var fileChannel : FileChannel = _
    var appendable = false
    override def preStart() : Unit = {
        //we use append mode  
        appendable = true
        val file = new File(target)
        if(file.exists()) {
          file.delete()
        }
        fileChannel = (new FileOutputStream(target, appendable)).getChannel
//         fw = new FileWriter(target, appendable)
    }
    
	def receive : Receive = {
	  case Line(content) => 
	    val line = content + "\n"
	    val start = System.nanoTime()
	    count += 1
//	    logInfo(self.path.name +" receive line->%s".format(content))
//	    logInfo(self.path.name +" current count->%s".format(count))
//	   fw.write(content+"\n")
	    var buf = ByteBuffer.wrap(line.getBytes());
        buf.put(line.getBytes());
        buf.flip();
        fileChannel write buf
	    
	    val end = System.nanoTime()
        val time = (end - start) 
//       logInfo("write one line using -> "+time + " ns"  )
        if(count % 10000 == 0) {
    	   logInfo("current write count of "+self.path.name + " is "+ count)
        }
//	    fw.flush()
       
	}
    
    override def postStop() : Unit = {
//       println("stop actor %s with count  %s".format(self.path.name, count))
//       fw close
      fileChannel.close()
    }
}