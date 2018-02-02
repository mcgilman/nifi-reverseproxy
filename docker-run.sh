#!/bin/bash

dirName=`dirname ${PWD}`
# n: nginx, haproxy ... etc
n=`basename ${dirName}`
# t: standalone-plain ... etc
t=`basename ${PWD}`

case $t in
  standalone-plain-http)
    p="-p 8080:8080"
    ;;
  standalone-plain-raw)
    p="-p 8080:8080 -p 8081:8081"
    ;;
  standalone-secure-http)
    p="-p 8443:8443"
    ;;
  standalone-secure-raw)
    p="-p 8443:8443 -p 8481:8481"
    ;;
  cluster-plain-raw)
    p="-p 18080:18080 -p 18081:18081 -p 18091:18091"
    ;;
  cluster-secure)
    p="-p 18443:18443"
    ;;
esac

docker run -d --name ${n}_${t} ${p} ${n}:${t}