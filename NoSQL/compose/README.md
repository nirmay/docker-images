Oracle NoSQL Database on Docker: 
==========
This sample set of docker-compose files demonstrates how to create a scalable Oracle NoSQL Database cluster on Docker with Multihost Network support. To get this up and running, follow these steps:

 1. Install Docker 1.9+ and Docker compose 1.10+

 2. Checkout the **compose** folder from the NoSQL repository

 3. Identify the topology you want to deploy:

    3.1 Choose **docker-compose1.yml** - for single shard cluster with replication_factor=1 that is deployed within single docker container.

    3.2 Choose **docker-compose1-wproxy.yml** - for single shard cluster with relication_factor=1 and KVProxy. This is useful if you are building application using node.js, c, .Net or python driver.

    3.3 Choose **docker-compose3.yml** - for 3 shard cluster with replication_factor=3 that is deployed over 3 docker containers

 4. Run the **docker-compose** command below to bring up the Oracle NoSQL Database cluster with the compose file identified above.

        docker-compose -f <docker-compose-file-from-step3> up &

 5. Run the following command to access nosqlstore1-1 container

        docker exec -it nosqlstore1-1 /bin/bash

 6. Check the status of the Oracle NoSQL Database cluster using ping command per below,

        java -jar lib/kvstore.jar ping -host localhost -ort 5000

 7. Stop all the docker containers with following command

        docker-compose -f <docker-compose-file-from-step3> down

# Copyright
Copyright (c) 2017 Oracle and/or its affiliates. All rights reserved.
