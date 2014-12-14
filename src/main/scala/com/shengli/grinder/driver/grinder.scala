package com.shengli.grinder.driver

import com.shengli.grinder.utils.Logging
import com.shengli.grinder.strategy.OneToOneOutputStrategy
import com.shengli.grinder.strategy.OneToManyOutputStrategy

/** 
* @ClassName: Grinder 
* @Description: TODO
* @author shengli.victor 盛利
*/ 
class Grinder(outputHandler: OutPutHandler) extends Logging {
  
   def grindMeat(line : String, meat : Meat) {
      val rule = meat.rule
      rule.out_strategy match {
        case one2one : OneToOneOutputStrategy =>
          outputHandler.handleOneToOneOutput(rule, line, one2one)
        
        case one2many : OneToManyOutputStrategy => 
          outputHandler.handleOneToManyOutput(rule, line, one2many)
      }
   }
   
}