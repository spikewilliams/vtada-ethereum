# vdata-ethereum
Ruby library for accessing the Ethereum blockchain via JSON RPC

# A simple example

This code lists the accounts at the default JSON RPC endpoint and prints the balance of the first account. It then sends a small amount of ether from the first account to the second.

```
w3 = Web3.new
accounts = w3.personal_listAccounts
puts w3.eth_getBalance accounts[0]
amount_to_send = 0.0001
w3.sendEther(accounts[0], accounts[1], amount_to_send, "mypassword")
```

NOTE: For the above code to work, the Web3 endpoint needs to be running the "personal" API, which is turned off in geth by default. Visit https://github.com/ethereum/go-ethereum/wiki/Management-APIs for details.

# Docs

Auto generated docs can be found at https://spikewilliams.github.io/vtada-ethereum/

# Configuration
Use environment variables to configure the vdata-ethereum client.

To set the endpoint (default is http://localhost:8545):

SET ETH_ENDPOINT=http://hostname:port

To set the client id (default is 999):

SET ETH_DEFAULT_CLIENT_ID=###

For debug mode:

SET ETH_DEBUG=true
