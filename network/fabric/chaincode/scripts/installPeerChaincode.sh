#!/bin/bash
PEER=$1
ORG=$2
MSP=$3
PORT=$4
VERSION=$5

ORDERER_CA=/opt/gopath/artifacts/certs/ordererOrganizations/anvisa.gov.br/orderers/orderer.anvisa.gov.br/msp/tlscacerts/tlsca.anvisa.gov.br-cert.pem
CORE_PEER_LOCALMSPID=$MSP
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/artifacts/certs/peerOrganizations/$ORG.anvisa.gov.br/peers/$PEER.$ORG.anvisa.gov.br/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/$ORG.anvisa.gov.br/users/Admin@$ORG.anvisa.gov.br/msp
CORE_PEER_ADDRESS=$PEER.$ORG.anvisa.gov.br:$PORT
CHANNEL_NAME=channelcreation
CORE_PEER_TLS_ENABLED=true
peer chaincode install -l node -n batchcc -v $VERSION -p /opt/gopath/chaincode/src/ >&log.txt
cat log.txt