package com.shengli.grinder.ds

import java.sql.DriverManager
import java.sql.Connection
import com.shengli.grinder.utils.PropsUtil
import java.io.IOException

trait DataSource {
  def getConnection() : Any
}

 
/** 
* @ClassName: MysqlDataSource 
* @Description: TODO
* @author shengli.victor 盛利
* @date 2014年11月21日 上午11:41:23  
*/ 
class MysqlDataSource extends DataSource {
  
  var connection:Connection = null
  
  def close() {
    if(connection != null) {
      connection.close();
    }
  }
  
  def getConnection() : Connection = {
    
    if(connection == null) {
	    val driver = "com.mysql.jdbc.Driver"
//	    val url = "jdbc:mysql://localhost/test"
//	    val username = "root"
//	    val password = "root"
	    val jdbc_conn_str = PropsUtil.get("grinder.meta.mysql.url")
	    // there's probably a better way to do this
	    try {
	      // make the connection
	      Class.forName(driver)
	      connection = DriverManager.getConnection(jdbc_conn_str)
	    }
	    catch {
	        case  e : Exception => throw new IOException("connect to meta store error! "+e)
	    }
	    connection
    }
    else connection
  }
  
 
}