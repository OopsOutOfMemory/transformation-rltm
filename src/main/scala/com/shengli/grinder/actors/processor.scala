package com.shengli.grinder.actors

import com.shengli.grinder.utils.Logging
import akka.actor.Actor
import com.shengli.grinder.entity.Line
import com.shengli.grinder.driver.OutPutHandler
import com.shengli.grinder.driver.Grinder
import scala.collection.mutable.ArrayBuffer
import akka.dispatch.RequiresMessageQueue
import akka.dispatch.BoundedMessageQueueSemantics
import com.shengli.grinder.utils.Logging
import akka.actor.PoisonPill

class ProcessorActor(meatModelList: ArrayBuffer[com.shengli.grinder.driver.Meat], outputHandler: OutPutHandler) extends Actor
with RequiresMessageQueue[BoundedMessageQueueSemantics] with Logging  {

  val grinder = new Grinder(outputHandler)
  var count = 0
  override def preStart(): Unit = {
  }

  def receive: Receive = {
    case Line(content) =>
//      logInfo(self.path.name + " receive line->%s".format(Line))
      val start = System.nanoTime()
      meatModelList.foreach { meat =>
        if (content.contains(meat.rule_exp)) {
          grinder.grindMeat(content, meat)
          val end = System.nanoTime()
	      val time = (end - start) 
//	      logInfo("process one line using -> "+time + " ns"  )
        }
      }
//      self ! PoisonPill
  }

  override def postStop(): Unit = {
  }
}