#!/bin/sh

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions

function error() {
SCRIPT="$0"           # script name
LASTLINE="$1"         # line of error occurrence
LASTERR="$2"          # error code
echo "ERROR exit from ${SCRIPT} : line ${LASTLINE} with exit code ${LASTERR}"
exit 1
}

trap 'error ${LINENO} ${?}' ERR

echo ""
echo "Welcome to try Eagle"
echo ""

echo "Eagle home folder path is $EAGLE_HOME"
cd $EAGLE_HOME


echo "Initializing Eagle Service ..."
sh ./bin/eagle-service-init.sh

echo "Starting Eagle Service ..."
sh ./bin/eagle-service.sh start

echo "Starting Eagle Service ..."
sh ./bin/eagle-service.sh start

echo "Initializing Eagle Topology ..."
sh ./bin/eagle-topology-init.sh

# TODO: More eagle start

echo "Eagle is deployed successfully!"
echo "Please visit http://<your_sandbox_ip>:9099 to play with Eagle!"
