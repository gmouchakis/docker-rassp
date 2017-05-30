#!/bin/bash

export CONF=/root/application.conf
export DOCKER_IP=`hostname -i`

sed -i "s/{?HOSTNAME}/$HOSTNAME/g" $CONF
sed -i "s/{?SEED_NODE}/$SEED_NODE/g" $CONF
sed -i "s/{?PEERS}/$PEERS/g" $CONF
sed -i "s/{?GROUP_SEEDS}/$GROUP_SEEDS/g" $CONF
sed -i "s/{?DOCKER_IP}/$DOCKER_IP/g" $CONF
