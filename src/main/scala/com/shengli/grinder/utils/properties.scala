package com.shengli.grinder.utils

import java.io.IOException

object PropsUtil {
	val prop = new PropsUtil
    def get(key : String) = {
	   prop.get(key)
    }
	
	def set(key: String, value: String) {
	  prop.set(key, value)
	}
}


class PropsUtil private{
    val p = new java.util.Properties()
    try {
	 p.load(this.getClass().getResourceAsStream("/grinder.conf")) 
	}
	catch {
	  case ioe : IOException => println("can not find grinder.conf in classpath")
	  case e : Exception => println("Unknow Exception when loading grinder.conf properties.")
	}
    
    def get(key : String) : String = {
//      println(p)
      p.getProperty(key)
    }
    
    def set(key: String, value: String) {
      p.setProperty(key, value)
    }
    
    
}