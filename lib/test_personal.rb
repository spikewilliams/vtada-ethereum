require_relative "web3"

w3 = Web3.new "http://brindigo.com:8545"

signAndSend = true
testpassword = "testpassword"
accounts = w3.personal_listAccounts
puts w3.eth_getBalance accounts[0]
transaction = {"from"=> accounts[0],  "to" => accounts[1],  "value" => w3.ether_to_0xwei(0.001)}
if signAndSend
  #w3.personal_signAndSendTransaction(transaction, testpassword)
  w3.sendEther(accounts[0], "0xAF73160759A70eB6DE64038dE09ab90c1428C459",0.5, "testpassword")
else
  w3.personal_unlockAccount(accounts[0], "testpassword", 60);
  w3.eth_sendTransaction(transaction)
  t2 = w3.eth_pendingTransactions()[0]
  w3.eth_resend(t2, w3.to_0x(100000), w3.to_0x(3333333))
  w3.eth_pendingTransactions()
  w3.personal_lockAccount(accounts[0])
end
puts w3.eth_getBalance accounts[0]
puts w3.eth_getBalance accounts[1]
