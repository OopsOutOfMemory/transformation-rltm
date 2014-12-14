package com.shengli.grinder.mapping

import scala.collection.mutable.HashMap
import com.shengli.grinder.ds.MysqlDatabase

/** 
* @ClassName: Mapping 
* @Description: Provide a mapping for user to use
* @author shengli.victor 鐩涘埄
* @date 2014骞�鏈�5鏃�涓嬪崍4:38:04  
*/ 
abstract class Mapping {
    def get(key : String) : String
    def get(game_name : String, log_name : String) : String
}


/** 
* @ClassName: AppMapping 
* @Description: App Mapping is for mapping different logs from input lines, eg: [app_name,[log_name, log_rules]] -> [ff14,[level_up_log,"Level_up\\d+"]]
*/ 
object LogRulesMapping extends Mapping {
  
   //mock mapping relations
   val mappings = new HashMap[String, HashMap[String, String]]()
   private val game1 = "ff14"
   private val ff14Mapping = new HashMap[String, String]()
   
   val mysqldb = new MysqlDatabase()
   val rs = mysqldb.query("select app_name, log_name, rule_expression from meta_rule where app_name='"+game1+"' ")
   while(rs.next) {
     val rule_exp = rs.getString("rule_expression");
     val log_name = rs.getString("log_name")
     ff14Mapping +=( rule_exp -> log_name )
   }
//   ff14Mapping foreach println
   mysqldb.close
   
//   ff14Mapping += ("""[gsys]ItemGet,"""->"ff14_item_get_log")
//   ff14Mapping += ("""[gsys]SetStack,"""->"ff14_stack_log")
//   ff14Mapping += ("""[evnt]CraftLeveNpcTrade"""->"ff14_craft_leve_npc_log")
//   ff14Mapping += ("""[gsys]TradeSubmit"""->"ff14_c2c_item_log")
   
   mappings += (game1 -> ff14Mapping)
//   mappings foreach println 
   
   def get(key : String) : String = {
     throw new RuntimeException("not supported yet.")
   }
   
   //get rules from the gieven game_name and log_name
   def get(game_name : String, rule_name : String) : String = {
	   val log_name = mappings.getOrElse(game_name, new HashMap()).getOrElse(rule_name, "")  
	   log_name.toString()
   }
}