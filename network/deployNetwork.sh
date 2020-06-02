# Start fabric and create channel
export COMPOSE_PROJECT_NAME=anvisa
./restartFabric.sh
docker exec cli /bin/bash "./createChannel.sh"