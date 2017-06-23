#!/bin/bash
sleep 10
echo "Connecting the RepNode : $RN1"
cat << EOF > /tmp/nosql.script
  configure -name kvstore
  plan deploy-zone -name "DC1" -rf 3 -wait
  plan deploy-sn -znname "DC1" -host $RN1 -port 5000 -wait
  plan deploy-admin -sn sn1 -port 5001 -wait
  plan deploy-sn -znname "DC1" -host $RN2 -port 5000 -wait
  plan deploy-admin -sn sn2 -port 5001 -wait
  plan deploy-sn -znname "DC1" -host $RN3 -port 5000 -wait
  plan deploy-admin -sn sn3 -port 5001 -wait
  topology create -name docker3x3 -pool AllStorageNodes -partitions 120
  plan deploy-topology -name docker3x3 -wait
EOF

cat /tmp/nosql.script | while read LINE ;do
  java -jar lib/kvstore.jar runadmin -host $RN1 -port 5000 $LINE;
done

echo "###########  Oracle NoSQL Cluster - status #######################"
java -jar lib/kvstore.jar ping -host $RN1 -port 5000; 

echo "Oracle NoSQL Database cluster is now setup"
exec "$@"
