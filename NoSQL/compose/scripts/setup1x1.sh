#!/bin/bash
sleep 8
echo "Connecting the RepNode : $RN1"
cat << EOF > /tmp/nosql.script
  configure -name kvstore
  plan deploy-zone -name "Rangabhoomi" -rf 1 -wait
  plan deploy-sn -znname "Rangabhoomi" -host $RN1 -port 5000 -wait
  plan deploy-admin -sn sn1 -port 5001 -wait
  topology create -name docker1x1 -pool AllStorageNodes -partitions 30
  plan deploy-topology -name docker1x1 -wait
EOF

cat /tmp/nosql.script | while read LINE ;do
  java -jar lib/kvstore.jar runadmin -host $RN1 -port 5000 $LINE;
done

java -jar lib/kvstore.jar ping -host $RN1 -port 5000; 

echo "Oracle NoSQL Database cluster is setup on $RN1"
exec "$@"
