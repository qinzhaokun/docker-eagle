#!/bin/bash


export PATH=/usr/jdk64/jdk1.7.0_67/bin:$PATH

./ambari-shell.sh << EOF
blueprint add --file /tmp/eagle-singlenode.json
blueprint add --file /tmp/eagle-multinode.json
cluster build --blueprint $BLUEPRINT
cluster autoAssign
cluster create --exitOnFinish true
EOF

clear

SERF_RPC_ADDR=${AMBARISERVER_PORT_9099_TCP##*/}
serf event --rpc-addr=$SERF_RPC_ADDR eagle

#./wait-for-eagle.sh
