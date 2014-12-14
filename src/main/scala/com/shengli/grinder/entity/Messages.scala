package com.shengli.grinder.entity

sealed trait Messages

case class ReadFile(file_path: String) extends Messages

case class StartFileDeCompress(path: String) extends Messages
case class FinishFileDecompress(rsult_path: String) extends Messages


case class Line(content : String) extends Messages
case class Log(log_name: String, value : String) extends Messages