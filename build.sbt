name := "spark-geolocation"

version := "0.1"

scalaVersion := "2.11.8"

val sparkVersion = "2.1.1"

libraryDependencies += "org.apache.spark" %% "spark-core" % sparkVersion % "provided"

libraryDependencies += "org.apache.spark" %% "spark-sql" % sparkVersion % "provided"
