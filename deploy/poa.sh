geth --datadir node1 --port 30305 --networkid 123454321 --unlock 0x1e782566A494e28290946B52ad2CD83Ceab78720 --password node1/password.txt --authrpc.port 8551 --mine --miner.etherbase 0x1e782566A494e28290946B52ad2CD83Ceab78720

geth --datadir node2 --port 30306 --bootnodes \ "enode://1a4dd79446d96fc6c5aab6e0a5fb32648f9e09423110042a5c2e95637924a4a9fc171aafc446369cd92d056cc48ddb2d6208aceafc9bbb8368e60ff7bce5e43b@127.0.0.1:30305"  --networkid 123454321 \
--authrpc.port 8552 --http --http.addr="0.0.0.0" --http.port="8545" --http.corsdomain="*" --http.vhosts="*" --http.api="eth,net,web3,debug,txpool" --ws  \
--ws.origins="*" --ws.addr="0.0.0.0" --ws.port="8546" \
--rpc.allow-unprotected-txs=true

curl -X POST \
  -H "Content-Type: application/json" \
  --data '{
    "jsonrpc":"2.0",
    "method":"eth_getBlockByNumber",
    "params":["0x2", true],
    "id":1
  }' \
  http://localhost:8545

curl -X POST \
  -H "Content-Type: application/json" \
  --data '{
    "jsonrpc":"2.0",
    "method":"eth_getBalance",
    "params":["0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266", "latest"],
    "id":1
  }' \
  http://localhost:8545



bash prysm.sh validator --interop-num-validators=64 --interop-start-index=0 --accept-terms-of-use
