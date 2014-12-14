package com.shengli.grinder.strategy

import com.shengli.grinder.utils.Logging

/** 
* @ClassName: Resolver 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:42:00  
*/ 
class Resolver extends Logging {
  
	 def resolveField( line : String , fieldDesc :FieldDesc) : String = {
	   val start = System.nanoTime()
	   //segments
	   val segments = line.split("\t")
	  
	   val segmentValue = segments(fieldDesc.segmentIndex)
//	    println("mkstring -> "+segmentValue.mkString)
	   //extract strategy
	   val res = fieldDesc.strategy.name match {
	     
	     //This strategy is used for regex matching
	     case "regex" => 
	       val regex = new RegexStrategy(segmentValue, fieldDesc)
	       val rs = regex.apply
//		   logInfo("regex apply using "+(System.nanoTime() - start) + " ns")
	       rs
	     case "regex_multiple" =>
	       val regex_multiple = new RegexMutipleStrategy(segmentValue, fieldDesc)
	       val rs = regex_multiple.apply
//	       logInfo("regex_multiple apply using "+(System.nanoTime() - start) + " ns")
	       rs
		 //This strategy is commonly used to fileId=fieldValue  
	     case "no_regex" => 
	       val no_regex = new CommonStrategy(segmentValue, fieldDesc)
	       val rs = no_regex.apply
//	       logInfo("no_regex apply using "+(System.nanoTime() - start) + " ns")
	       rs
	     //This strategy is used for the segment directly field
	     case "single_value" => 
	       val do_nothing = new SingleValueStrategy(segmentValue)
	       val rs = do_nothing.apply
//	       logInfo("single_value apply using "+(System.nanoTime() - start) + " ns")
	       rs
	     case "mapping" =>
	       val do_mapping = new MappingStrategy(segmentValue)
	       val rs = do_mapping.apply
	       rs
	   }
	   res
   }
}