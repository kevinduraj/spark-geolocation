#!/bin/bash -x
#-----------------------------------------------------------------------------------#
  if [ "$1" == "0" ] 2>/dev/null; then
    echo "sbt clean package"
    sbt clean package

#-----------------------------------------------------------------------------------#
# GeoLookup.scala
#-----------------------------------------------------------------------------------#
elif [ "$1" == "1" ] 2>/dev/null; then

time spark-submit                                       \
    --class "org.apache.spark.examples.GeoLookup"       \
    --master "local[4]"                                 \
    --driver-memory   16G                               \
    --executor-memory 8G                                \
    target/scala-2.11/spark-pi_2.11-0.1.jar             \
    "100" 

#-----------------------------------------------------------------------------------#
elif [ "$1" == "2" ] 2>/dev/null; then

time spark-submit                                       \
    --class "org.apache.spark.examples.GeoLookup"       \
    --master spark://69.13.39.34:7077                   \
    --driver-memory   16G                               \
    --executor-memory 8G                                \
    target/scala-2.11/spark-pi_2.11-0.1.jar             \
    "100" 

#-----------------------------------------------------------------------------------#
else

  echo "+---------------------------------------------+"
  echo "| ./run.sh 0 -- sbt clean package             |"
  echo "+---------------------------------------------+"
  echo "| ./run.sh 1 -- GeoLookup Local               |"
  echo "| ./run.sh 2 -- GeoLooup Remote               |"
  echo "+---------------------------------------------+"

fi
#-----------------------------------------------------------------------------------#
reset
