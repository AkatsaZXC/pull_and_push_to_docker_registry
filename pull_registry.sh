#!/bin/bash


if grep -Fxq "{ "insecure-registries":["nexus.vsfi.local:8082", "registry.naliway.local:8080"] }" /etc/docker/daemon.json
then
	docker login -u $USERR -p $PASSR $REMOTER
	docker login -u $USERL -p $PASSL $LOCALR
else
	echo '{ "insecure-registries":["nexus.vsfi.local:8082", "registry.naliway.local:8080"] }' > /etc/docker/daemon.json
	service docker restart
	docker login -u $USERR -p $PASSR $REMOTER
	docker login -u $USERL -p $PASSL $LOCALR
fi

docker pull $REMOTER/$1 
docker image tag $REMOTER/$1 $LOCALR/$1
docker push $LOCALR/$1


