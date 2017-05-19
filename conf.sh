#!/bin/bash

export CONF=/root/application.conf
export DOCKER_IP=`hostname -i`

sed -i "s/{?HOSTNAME}/$HOSTNAME/g" $CONF
sed -i "s/{?SEED_NODE}/$SEED_NODE/g" $CONF
sed -i "s/{?PEER_1}/$PEER_1/g" $CONF
sed -i "s/{?PEER_2}/$PEER_2/g" $CONF
sed -i "s/{?PEER_3}/$PEER_3/g" $CONF
sed -i "s/{?PEER_4}/$PEER_4/g" $CONF
sed -i "s/{?PEER_5}/$PEER_5/g" $CONF
sed -i "s/{?PEER_6}/$PEER_6/g" $CONF
sed -i "s/{?PEER_7}/$PEER_7/g" $CONF
sed -i "s/{?PEER_8}/$PEER_8/g" $CONF
sed -i "s/{?PEER_9}/$PEER_9/g" $CONF
sed -i "s/{?PEER_10}/$PEER_10/g" $CONF
sed -i "s/{?GROUP_SEED}/$GROUP_SEED/g" $CON
sed -i "s/{?DOCKER_IP}/$DOCKER_IP/g" $CONF
