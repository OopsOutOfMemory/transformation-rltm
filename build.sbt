import AssemblyKeys._
assemblySettings

name := "transformation-rltm"

version := "1.0"

scalaVersion := "2.10.4"

EclipseKeys.createSrc := EclipseCreateSrc.Default + EclipseCreateSrc.Resource

net.virtualvoid.sbt.graph.Plugin.graphSettings

libraryDependencies ++= Seq(
  "com.typesafe.akka" % "akka-actor_2.10" % "2.3.4" withSources () ,
  "org.scalatest" % "scalatest_2.10" % "2.2.0",
   "log4j" % "log4j" % "1.2.17",
   "org.slf4j" % "slf4j-api" % "1.7.7",
   "org.slf4j" % "slf4j-log4j12" % "1.5.6",
   "org.json4s" %% "json4s-native" % "3.2.10",  
   "org.json4s" %% "json4s-jackson" % "3.2.10",
   "com.esotericsoftware.reflectasm" % "reflectasm" % "1.07",
   "com.esotericsoftware.kryo" % "kryo" % "2.21",
   "org.apache.kafka" % "kafka_2.10" % "0.8.1.1",
   "mysql" % "mysql-connector-java" % "5.1.18"
)


resolvers ++= Seq(
      // HTTPS is unavailable for Maven Central
      "Typesafe Repository" at "http://repo.typesafe.com/typesafe/releases/",
      "Maven Repository"     at "http://repo.maven.apache.org/maven2",
      "Apache Repository"    at "https://repository.apache.org/content/repositories/releases",
      "JBoss Repository"     at "https://repository.jboss.org/nexus/content/repositories/releases/",
      "MQTT Repository"      at "https://repo.eclipse.org/content/repositories/paho-releases/",
      "Cloudera Repository"  at "http://repository.cloudera.com/artifactory/cloudera-repos/",
	  "cloudera"             at "https://repository.cloudera.com/content/repositories/releases",
	  "snda" at "http://nexus.dw.sdo.com/content/repositories/3rd-party",
      // For Sonatype publishing
      // "sonatype-snapshots"   at "https://oss.sonatype.org/content/repositories/snapshots",
      // "sonatype-staging"     at "https://oss.sonatype.org/service/local/staging/deploy/maven2/",
      // also check the local Maven repository ~/.m2
      Resolver.mavenLocal,
	  Resolver.sonatypeRepo("releases"),
      Resolver.sonatypeRepo("snaspshots")
)

mergeStrategy in assembly <<= (mergeStrategy in assembly) { mergeStrategy => {
 case entry => {
   val strategy = mergeStrategy(entry)
   if (strategy == MergeStrategy.deduplicate) MergeStrategy.first
   else strategy
 }
}}