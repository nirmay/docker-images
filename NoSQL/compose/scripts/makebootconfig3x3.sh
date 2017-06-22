#!/bin/bash

KVROOT=/kvroot
mkdir -p $KVROOT/u01
mkdir -p $KVROOT/u02
mkdir -p $KVROOT/u03

########### Bootstrap Storage Node ##########
java -jar lib/kvstore.jar makebootconfig \
	-root $KVROOT \
	-store-security none \
	-capacity 3 \
	-harange 5010,5030 \
	-port 5000 \
	-memory_mb 200\
	-host $RNHOST \
	-storagedir $KVROOT/u01 \
	-storagedir $KVROOT/u02 \
	-storagedir $KVROOT/u03 \

echo " Done bootstrapping storage-node $RNHOST"
################################################

exec "$@"
