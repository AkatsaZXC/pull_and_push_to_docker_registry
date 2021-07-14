#!/bin/bash

for line in $(cat containers.txt)
	do
		USERR=vsfi_push PASSR=vsfi_push USERL=admin PASSL=NaliWay2021 REMOTER=nexus.vsfi.local:8082 LOCALR=registry.naliway.local:8080 ./pull_registry.sh $line
		sleep 5
	done
	