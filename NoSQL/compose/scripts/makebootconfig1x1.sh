#!/bin/bash

KVROOT=/kvroot

########### Bootstrap Storage Node 1 ##########
java -jar lib/kvstore.jar makebootconfig \
	-root $KVROOT \
	-store-security none \
	-capacity 1 \
	-harange 5010,5030 \
	-port 5000 \
	-memory_mb 200\
	-host $RNHOST \
	-storagedir $KVROOT \

echo " Done bootstrapping storage-node "
################################################

exec "$@"
