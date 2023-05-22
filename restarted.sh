#!/bin/sh

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

rm -f chainblock/data/ethereum.log
rm -rf chainblock/data/node1/geth/
rm -rf chainblock/data/node1/geth.ipc/

docker-compose -f chainblock/docker-compose.yml up -d

rm -rf blockscout/

git clone https://github.com/blockscout/blockscout.git

cp docker-compose-no-build-geth.yml blockscout/docker-compose/

docker-compose -f blockscout/docker-compose/docker-compose-no-build-geth.yml up -d
