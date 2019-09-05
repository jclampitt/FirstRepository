#!/bin/sh

docker build -t devopstest .
docker run -p 8080:3000 -d devopstest
sleep 3
curl http://localhost:8080/me