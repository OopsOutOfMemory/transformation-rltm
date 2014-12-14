package com.shengli.grinder.ds

import java.sql.Connection
import java.sql.ResultSet
import java.sql.SQLException

trait DataBase {
	def query(sql : String) : Any
	
	def close()
}

 
/** 
* @ClassName: MysqlDatabase 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:28  
*/ 
class MysqlDatabase extends DataBase {
    
    val ds = new MysqlDataSource()
    var conn : Connection = ds.getConnection 
    
   //used to execute like ddl native command which return no result set
   def nativeCommand(sql : String) = {
     conn.createStatement().execute(sql)
   }
   
   //query table
   def query(sql : String) : ResultSet = {
    var resultSet : ResultSet = null
    try{
      // create the statement, and run the select query
      val statement = conn.createStatement()
       resultSet = statement.executeQuery(sql)
//      while ( resultSet.next() ) {
//        val app_name = resultSet.getString("app_name")
//        val rule_content = resultSet.getString("rule_content")
//        println("app_name = " + app_name )
//        println("rule_content = " + rule_content )
//      }
    } catch {
      case e : Exception => e.printStackTrace
    }
    resultSet
  }
   
   
   def close(){
     try{
    	 conn.close()
     }
     catch {
       case sql_e : SQLException => println("Error closing mysql database!")
     }
     finally{
       conn.close()
     }
   }
}