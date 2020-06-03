#!/bin/bash
export ORDERER_CA=/opt/gopath/artifacts/certs/ordererOrganizations/anvisa.gov.br/orderers/orderer.anvisa.gov.br/msp/tlscacerts/tlsca.anvisa.gov.br-cert.pem

export COMPOSE_PROJECT_NAME=anvisa

peer chaincode instantiate -o orderer.anvisa.gov.br:7050 --tls true --cafile $ORDERER_CA -C channelcreation -l node -n batchcc -v 1.0 -c '{"Args":[]}' >&log.txt

cat log.txt