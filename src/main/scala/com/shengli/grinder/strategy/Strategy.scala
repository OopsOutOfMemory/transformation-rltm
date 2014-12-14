package com.shengli.grinder.strategy

import scala.collection.mutable.ListBuffer
import com.shengli.grinder.utils.RegexUtil
import com.shengli.grinder.utils.Logging
import scala.collection.mutable.ArrayBuffer
import com.shengli.grinder.utils.PropsUtil

case class FieldDesc(fieldName:String, segmentIndex:Int,  strategy : Strategy,  splitor : String, extract : String)
case class Strategy(name:String, expression:String, group: Option[Int], return_mode: Option[String])
case class Rule(app_name : String, rule_expression : String, fieldList : List[FieldDesc],  out_strategy : Any)


class OutputStrategy(name : String)
class OneToManyOutputStrategy(name:String, var iterate_fields : String) extends OutputStrategy(name)
class OneToOneOutputStrategy(name : String) extends OutputStrategy(name)

//use for different strategies to matching fields
abstract case class BaseStrategy extends Logging {
  def apply(): Any
}


/** 
* @ClassName: BaseRegexStrategy 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:42:08  
*/ 
class BaseRegexStrategy extends BaseStrategy  {
  //six ~
  val pipleIdentifier = "~~~~~~"
    
  def apply(): Any = {}
  
  //check if the regex is a piple line
  def isPipleRegex(expression : String) : Boolean = {
    if(expression.contains(pipleIdentifier)){
      true
    }
    else{
      false  
    }
  }
  
  //This regex piple line take effect on every regex but the last will not execute,
  //only the last one should be passed to execute. return the pre-process string
  def pipleMatchRegexValue(expression : String,  fieldString: String) = {
    if(isPipleRegex(expression)) {
      val regexList = expression.split(pipleIdentifier,-1)
      val lastRegex = regexList(regexList.length-1)
      val preRegex = regexList.slice(0, regexList.length-1)
      var field = fieldString
      val rs = preRegex.foreach{ regex=>
       field = RegexUtil.MatchRegex(regex, field)
      }
      (lastRegex,field)
    }
    else {
      (expression,fieldString)
    }
  }
}

/** 
* @ClassName: RegexMutipleStrategy 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:42:12  
*/ 
class RegexMutipleStrategy(fieldString : String,fieldDesc :FieldDesc) extends BaseRegexStrategy {
    override def apply() : String = {
     try{
       val (exp,str) =  pipleMatchRegexValue(fieldDesc.strategy.expression, fieldString)
         val start = System.nanoTime()
       val rtList = RegexUtil.MatchMutipleRegex(exp, str)
//         logInfo("MatchMutipleRegex using " + (System.nanoTime() - start) + " ns")
//       println(rtList)
       var ret = ListBuffer[String]()
	   //extract
	   val fieldTemp = fieldDesc.extract match {
	         case "right" =>
	           rtList.foreach{ e=>
	           val fieldValueArray = e.split(fieldDesc.splitor,-1)
	           if(fieldValueArray.size>0) ret += fieldValueArray(1) else ret += ""
	           }
	           ret.toList
	           
	         case ""=>
	           rtList
	           
	         case _ =>
	           throw new UnsupportedOperationException("Unsupport extraction!")
	   }
       
        val return_value = fieldDesc.strategy.return_mode.getOrElse("empty") match {
		         case mode => 
		           if (mode=="empty") {
//		              println(mode)
		              fieldTemp.mkString(",")
		           }
		           else {
		             val idx = Integer.parseInt(mode)
//		             println(mode)
		             fieldTemp(idx)
		           }
		       }

       return_value
     }
     catch {
       case ex : ArrayIndexOutOfBoundsException => 
         logError("Error when extract field %s, split error, index out of bounds!".format(fieldDesc.fieldName))
         throw new RuntimeException("Error when apply regex strategy on field " + fieldDesc.fieldName) 
     }
  }
}

/** 
* @ClassName: RegexStrategy 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:42:15  
*/ 
class RegexStrategy(fieldString : String,fieldDesc :FieldDesc) extends BaseRegexStrategy {
  override def apply() : String = {
     try{
       
       val start = System.nanoTime()
       val (exp,str) =  pipleMatchRegexValue(fieldDesc.strategy.expression, fieldString)
//       logInfo("pipleMatchRegexValue using " + (System.nanoTime() - start) + " ns")
       val start1 = System.nanoTime()
       
       var rt : String = null
       //whether to use group
       if(fieldDesc.strategy.group.isDefined) {
        rt = RegexUtil.MatchRegexWithGroup(exp, str, fieldDesc.strategy.group.get)
       }
       else {
         rt = RegexUtil.MatchRegex(exp, str)
       }
//       logInfo("RegexUtil.MatchRegex using " + (System.nanoTime() - start1) + " ns")
	        //extract
		   val fieldValue = fieldDesc.extract match {
		         case "right" =>
		           val fieldValueArray = rt.split(fieldDesc.splitor,-1)
		           if(fieldValueArray.size>0)  fieldValueArray(1) else ""
		         case _ =>
		           rt
		   }
           fieldValue.toString()
     }
     catch {
       case ex : ArrayIndexOutOfBoundsException => 
         logError("Error when extract field %s, split error, index out of bounds!".format(fieldDesc.fieldName))
         throw new RuntimeException("Error when apply regex strategy on field " + fieldDesc.fieldName) 
     }
  }
}

//This Strategy is for fieldName = fieldValue, return fieldValue
/** 
* @ClassName: CommonStrategy 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:42:19  
*/ 
class CommonStrategy(fieldString : String, fieldDesc :FieldDesc) extends BaseStrategy {
    override def apply() : String = {
    	val fieldValueArray = fieldString.split(fieldDesc.splitor,-1)
		   val fieldValue = fieldDesc.extract match {
		         case "right" =>
		            if(fieldValueArray.size>0)  fieldValueArray(1) else ""
		         case _ =>
		           None 
	       }
		   fieldValue.toString()
  }
}

//This Strategy is do not need matching, just return itself
/** 
* @ClassName: SingleValueStrategy 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:45:51  
*/ 
class SingleValueStrategy(fieldString : String) extends BaseStrategy {
    override def apply() : String = {
    	fieldString.toString()
  }
}



class MappingStrategy(fieldString : String) extends BaseStrategy {
    override def apply() : String = {
    	PropsUtil.get(fieldString)
  }
}
