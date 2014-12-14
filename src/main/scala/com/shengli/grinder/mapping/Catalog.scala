package com.shengli.grinder.mapping

import scala.collection.mutable.HashMap

abstract class UDF {
  
  //parameters of a udf is composed with server , eg: a,b,c
  def eval(params: String, input: String): String  
  
} 


class Catalog {
	
	def lookUpAndExecUdf(udf_name: String, params: String, input: String) {
      
	  if (FunctionRegister.udfs.get(udf_name).isDefined) {
	    FunctionRegister.udfs.get(udf_name).asInstanceOf[UDF].eval(params,input)
	  }
	  else{
	    throw new UnsupportedOperationException("not support udf found -> "+ udf_name)
	  }
	  
	}
}


object FunctionRegister {
	var relations = new HashMap[String, UDF]
	
	def udfs = relations
	
	def registerFunction(name:String, udf: UDF) {
		relations.put(name, udf)
	}
	
	//get_value_in_brackets
}

/*
 * get_value_in_brackets, can pass any {} [] ().
 * eg: input is  Maket[shengli] 
 * get_value_in_brackets  then pass {} as parameter, then you will get shengli as a value   
 */
class GetValueInBrackets extends UDF {
  
  override def eval(params: String, input: String): String  = {
    // this params should be {}, (), [] 
//    params match {
////      case "()" =>
////        extractValueInBrackets(params,input)
////      case "[]" =>
////        
////      case _ => throw UnsupportedOperationException("")
//    }
    ""
  }
  
  def extractValueInBrackets(brackets: String, input: String) {
     val leftBrackets = brackets.charAt(0)
     val rightBrackets = brackets.charAt(1)
  }
}
