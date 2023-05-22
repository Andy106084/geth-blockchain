#!/bin/sh

geth init --datadir /data/node1 data/genesis.json
    
api=debug,web3,eth,txpool,ethash,net

geth --datadir /data/node1 \
     --networkid 123 \
     --nodiscover \
     --http \
     --http.addr "0.0.0.0" \
     --http.port 8545 \
     --maxpeers 5 \
     --rpc.enabledeprecatedpersonal \
     --allow-insecure-unlock \
     --http.corsdomain "*" \
     --http.api web3,eth,debug,personal,net,miner,admin,txpool \
     --vmdebug \
     --ws \
     --ws.addr "0.0.0.0" \
     --ws.port 8888 \
     --ws.origins "*" \
     --ws.api ${api} >> /data/ethereum.log 2>&1 \
     --mine \
     --miner.etherbase "0xd78cbd42d7f56897d5c562ddd6b1b1837d72b54e" \
