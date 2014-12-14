package com.shengli.grinder.utils

import org.apache.log4j.{LogManager, PropertyConfigurator}
import org.slf4j.{Logger, LoggerFactory}
import org.slf4j.impl.StaticLoggerBinder

trait Logging {
  // Make the log field transient so that objects with Logging can
  // be serialized and used on another machine
  @transient private var log_ : Logger = null

  // Method to get or create the logger for this object
  protected def log: Logger = {
    if (log_ == null) {
      initializeIfNecessary()
      var className = this.getClass.getName
      // Ignore trailing $'s in the class names for Scala objects
      if (className.endsWith("$")) {
        className = className.substring(0, className.length - 1)
      }
      log_ = LoggerFactory.getLogger(className)
    }
    log_
  }

  // Log methods that take only a String
  protected def logInfo(msg: => String) {
    if (log.isInfoEnabled) log.info(msg)
  }

  protected def logDebug(msg: => String) {
    if (log.isDebugEnabled) log.debug(msg)
  }

  protected def logTrace(msg: => String) {
    if (log.isTraceEnabled) log.trace(msg)
  }

  protected def logWarning(msg: => String) {
    if (log.isWarnEnabled) log.warn(msg)
  }

  protected def logError(msg: => String) {
    if (log.isErrorEnabled) log.error(msg)
  }

  // Log methods that take Throwables (Exceptions/Errors) too
  protected def logInfo(msg: => String, throwable: Throwable) {
    if (log.isInfoEnabled) log.info(msg, throwable)
  }

  protected def logDebug(msg: => String, throwable: Throwable) {
    if (log.isDebugEnabled) log.debug(msg, throwable)
  }

  protected def logTrace(msg: => String, throwable: Throwable) {
    if (log.isTraceEnabled) log.trace(msg, throwable)
  }

  protected def logWarning(msg: => String, throwable: Throwable) {
    if (log.isWarnEnabled) log.warn(msg, throwable)
  }

  protected def logError(msg: => String, throwable: Throwable) {
    if (log.isErrorEnabled) log.error(msg, throwable)
  }

  protected def isTraceEnabled(): Boolean = {
    log.isTraceEnabled
  }

  private def initializeIfNecessary() {
    if (!Logging.initialized) {
      Logging.initLock.synchronized {
        if (!Logging.initialized) {
          initializeLogging()
        }
      }
    }
  }

  private def initializeLogging() {
    // If Log4j is being used, but is not initialized, load a default properties file
    val binder = StaticLoggerBinder.getSingleton
    val usingLog4j = binder.getLoggerFactoryClassStr.endsWith("Log4jLoggerFactory")
    val log4jInitialized = LogManager.getRootLogger.getAllAppenders.hasMoreElements
    if (!log4jInitialized && usingLog4j) {
      val defaultLogProps = "log4j-defaults.properties"
      Option(this.getClass.getClassLoader.getResource(defaultLogProps)) match {
        case Some(url) =>
          PropertyConfigurator.configure(url)
          log.info(s"Using our default log4j profile: $defaultLogProps")
        case None =>
          System.err.println(s"unable to load $defaultLogProps")
      }
    }
    Logging.initialized = true

    // Force a call into slf4j to initialize it. Avoids this happening from mutliple threads
    // and triggering this: http://mailman.qos.ch/pipermail/slf4j-dev/2010-April/002956.html
    log
  }
}

private object Logging {
  @volatile private var initialized = false
  val initLock = new Object()
  try {
    // We use reflection here to handle the case where users remove the
    // slf4j-to-jul bridge order to route their logs to JUL.
    val bridgeClass = Class.forName("org.slf4j.bridge.SLF4JBridgeHandler")
    bridgeClass.getMethod("removeHandlersForRootLogger").invoke(null)
    val installed = bridgeClass.getMethod("isInstalled").invoke(null).asInstanceOf[Boolean]
    if (!installed) {
      bridgeClass.getMethod("install").invoke(null)
    }
  } catch {
    case e: ClassNotFoundException => // can't log anything yet so just fail silently
  }
}
