package com.shengli.grinder.actors

import com.shengli.grinder.utils.Logging
import akka.actor.Actor
//import com.shengli.dw.hdfsfile.HdfsFileUtil
import com.shengli.grinder.entity.StartFileDeCompress
import com.shengli.grinder.entity.FinishFileDecompress



/** 
* @ClassName: BaseFileDecompressor 
* @Description: These actors will be used to decompress a compressed file to a text file
* @author shengli.victor 盛利
* @date 2014年12月9日 上午11:03:51  
*/ 
class BaseFileDecompressor extends Actor with Logging {
	override def receive : Receive  = ???
	
	def decompressFile(path: String): String = ???
}


class SeqLzoFileDecompressor extends BaseFileDecompressor  {
    
	override def receive : Receive  = { 
	  case StartFileDeCompress(path) =>
	  	val rsPath = decompressFile(path)
	  	val reader = context.actorFor("/user/single_reader")
	  	reader ! FinishFileDecompress(rsPath)
	}
	
//	override def decompressFile(path: String): String = {
////	   HdfsFileUtil.getTmpFilePath(path)
//	}
}