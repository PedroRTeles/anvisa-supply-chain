echo "Creating channel"
CORE_PEER_ADDRESS=peer0.industry.anvisa.gov.br:7051
CORE_PEER_LOCALMSPID=IndustryMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/industry.anvisa.gov.br/users/Admin@industry.anvisa.gov.br/msp

peer channel create -o orderer.anvisa.gov.br:7050 -c channelcreation -f ./artifacts/channel/channel.tx

sleep 20

echo "Joining peers"
peer channel join -b channelcreation.block

CORE_PEER_ADDRESS=peer1.industry.anvisa.gov.br:7051
peer channel join -b channelcreation.block

CORE_PEER_LOCALMSPID=ProviderMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/provider.anvisa.gov.br/users/Admin@provider.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.provider.anvisa.gov.br:7051
peer channel join -b channelcreation.block

CORE_PEER_ADDRESS=peer1.provider.anvisa.gov.br:7051
peer channel join -b channelcreation.block


CORE_PEER_LOCALMSPID=DrugstoreMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/drugstore.anvisa.gov.br/users/Admin@drugstore.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.drugstore.anvisa.gov.br:7051
peer channel join -b channelcreation.block

CORE_PEER_ADDRESS=peer1.drugstore.anvisa.gov.br:7051
peer channel join -b channelcreation.block


CORE_PEER_LOCALMSPID=BuyerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/buyer.anvisa.gov.br/users/Admin@buyer.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.buyer.anvisa.gov.br:7051
peer channel join -b channelcreation.block

CORE_PEER_ADDRESS=peer1.buyer.anvisa.gov.br:7051
peer channel join -b channelcreation.block

echo "Updating anchor peers"
CORE_PEER_LOCALMSPID=IndustryMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/industry.anvisa.gov.br/users/Admin@industry.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.industry.anvisa.gov.br:7051
peer channel update -o orderer.anvisa.gov.br:7050 -c channelcreation -f ./artifacts/channel/IndustryAnchor.tx

CORE_PEER_LOCALMSPID=ProviderMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/provider.anvisa.gov.br/users/Admin@provider.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.provider.anvisa.gov.br:7051
peer channel update -o orderer.anvisa.gov.br:7050 -c channelcreation -f ./artifacts/channel/ProviderAnchor.tx

CORE_PEER_LOCALMSPID=DrugstoreMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/drugstore.anvisa.gov.br/users/Admin@drugstore.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.drugstore.anvisa.gov.br:7051
peer channel update -o orderer.anvisa.gov.br:7050 -c channelcreation -f ./artifacts/channel/DrugstoreAnchor.tx

CORE_PEER_LOCALMSPID=BuyerMSP
CORE_PEER_MSPCONFIGPATH=/opt/gopath/artifacts/certs/peerOrganizations/buyer.anvisa.gov.br/users/Admin@buyer.anvisa.gov.br/msp
CORE_PEER_ADDRESS=peer0.buyer.anvisa.gov.br:7051
peer channel update -o orderer.anvisa.gov.br:7050 -c channelcreation -f ./artifacts/channel/BuyerAnchor.tx
