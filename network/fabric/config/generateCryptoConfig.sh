../../../bin/cryptogen generate --config crypto-config.yaml --output=../artifacts/certs
mkdir ../artifacts/channel
../../../bin/configtxgen -profile GenesisBlockGeneration -outputBlock ../artifacts/channel/genesis.block -channelID channelorderergenesis
../../../bin/configtxgen -profile ChannelCreation -outputCreateChannelTx ../artifacts/channel/channel.tx -channelID channelcreation