#echo "Installing chaincode for industry..."
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer0 industry IndustryMSP 7051 1.0
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer1 industry IndustryMSP 7051 1.0
#echo "Installing chaincode for provider..."
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer0 provider ProviderMSP 7051 1.0
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer1 provider ProviderMSP 7051 1.0
#echo "Installing chaincode for drugstore..."
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer0 drugstore DrugstoreMSP 7051 1.0
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer1 drugstore DrugstoreMSP 7051 1.0
#echo "Installing chaincode for buyer..."
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer0 buyer BuyerMSP 7051 1.0
#docker exec -it cli ./chaincode/scripts/installPeerChaincode.sh peer1 buyer BuyerMSP 7051 1.0
echo "Instanciating the chaincode..."
docker exec -it cli ./chaincode/scripts/instantiateChaincode.sh