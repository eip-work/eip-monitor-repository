#!/bin/bash
tag=eipwork/eip-monitor-eureka

mvn clean package -Dmaven.test.skip=true

docker build -t $tag:latest .

if test "$1" != ""; then
  docker push $tag:latest
  docker tag $tag:latest $tag:$1
  docker push $tag:$1
fi
