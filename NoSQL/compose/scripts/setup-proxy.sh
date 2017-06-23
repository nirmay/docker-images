#!/bin/bash
sleep 30
echo "Starting Oracle NoSQL Database - proxy"

java -cp nosqldb/kvproxy/lib/kvproxy.jar oracle.kv.proxy.KVProxy -port 7010 -helper-hosts $HELPER_HOST:5000 -store kvstore; 

