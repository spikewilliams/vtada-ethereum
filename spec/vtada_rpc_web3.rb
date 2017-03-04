require "vtada_rpc"

RSpec.describe VtadaRPC do

  context "request for web3_clientVersion " do
    it "is a String" do
      vt = VtadaRPC. new
      value = vt. web3_clientVersion
      expect(value).to be_a(String)
    end
  end

  context "request for web3_sha3 0x123456" do
    it "returns 0x6adf031833174bbe4c85eafe59ddb54e6584648c2c962c6f94791ab49caa0ad4" do
      vt = VtadaRPC. new
      value = vt. web3_sha3 "0x123456"
      expect(value).to eq "0x6adf031833174bbe4c85eafe59ddb54e6584648c2c962c6f94791ab49caa0ad4"
    end
  end

  context "request for net_version " do
    it "is a String" do
      vt = VtadaRPC. new
      value = vt. net_version
      expect(value).to be_a(String)
    end
  end

  context "request for net_peerCount " do
    it "is an Integer" do
      vt = VtadaRPC. new
      value = vt. net_peerCount
      expect(value).to be_a(Integer)
    end
  end

  context "request for net_listening " do
    it "returns true" do
      vt = VtadaRPC. new
      value = vt. net_listening
      expect(value).to eq true
    end
  end

  context "request for eth_protocolVersion " do
    it "exists" do
      vt = VtadaRPC. new
      value = vt. eth_protocolVersion
      expect(value).to exists
    end
  end

  context "request for eth_syncing " do
    it "is true or false" do
      vt = VtadaRPC. new
      value = vt. eth_syncing
      expect(value === true || value === false).to eq true
    end
  end

  #this is not implemented in the light geth client, and it throws an error
  context "request for eth_coinbase " do
    it "exists" do
      vt = VtadaRPC. new
      value = vt. eth_coinbase
      expect(value).to exist
    end
  end

  context "request for eth_mining " do
    it "is true or false" do
      vt = VtadaRPC. new
      value = vt. eth_mining
      expect(value === true || value === false).to eq true
    end
  end

  context "request for eth_hashrate " do
    it "returns 0" do
      vt = VtadaRPC. new
      value = vt. eth_hashrate
      expect(value).to eq 0
    end
  end

  context "request for eth_gasPrice " do
    it "returns value > 1000" do
      vt = VtadaRPC. new
      value = vt. eth_gasPrice
      expect(value).to be > 1000
    end
  end

  context "request for eth_accounts " do
    it "returns Array" do
      vt = VtadaRPC. new
      value = vt. eth_accounts
      expect(value).to be_an_instance_of Array
    end
  end

  context "request for eth_blockNumber " do
    it "returns an Integer" do
      vt = VtadaRPC. new
      value = vt. eth_blockNumber
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getBalance " do
    it "returns an Integer" do
      vt = VtadaRPC. new "0x14226aD04625ED4930787D87C82c6c72a5B690a1"
      value = vt. eth_getBalance
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getStorageAt " do
    it "returns 0x0000000000000000000000000000000000000000000000000000000000000000" do
      vt = VtadaRPC. new
      value = vt. eth_getStorageAt("0x295a70b2de5e3953354a6a8344e616ed314d7251",0)
      expect(value).to eq "0x0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  context "request for eth_getTransactionCount " do
    it "returns an Integer" do
      vt = VtadaRPC. new
      value = vt. eth_getTransactionCount("0x14226aD04625ED4930787D87C82c6c72a5B690a1","latest")
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getBlockTransactionCountByHash 0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9" do
    it "returns 16" do
      vt = VtadaRPC. new
      value = vt. eth_getBlockTransactionCountByHash("0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9")
      expect(value).to eq 16
    end
  end

  context "request for eth_getBlockTransactionCountByNumber 3267552" do
    it "returns 16" do
      vt = VtadaRPC. new
      value = vt. eth_getBlockTransactionCountByNumber 3267552
      expect(value).to eq 16
    end
  end

  context "request for eth_getUncleCountByBlockHash 0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9" do
    it "returns 0" do
      vt = VtadaRPC. new
      value = vt. eth_getUncleCountByBlockHash "0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9"
      expect(value).to eq 0
    end
  end

  context "request for eth_getUncleCountByBlockNumber 3267552" do
    it "returns 3267552" do
      vt = VtadaRPC. new
      value = vt. eth_getUncleCountByBlockNumber 3267552
      expect(value).to eq 0
    end
  end

  context "request for eth_getCode 0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b" do
    it "returns an Object" do
      vt = VtadaRPC. new
      value = vt. eth_getCode("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b",2)
      expect(value).to be_an Object
    end
  end

  context "request for eth_sign " do
    it "returns String" do
      vt = VtadaRPC. new "0x14226aD04625ED4930787D87C82c6c72a5B690a1"
      value = vt. eth_sign "0xdeadbeaf"
      expect(value).to be_a String
    end
  end

  context "request for eth_sendTransaction " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_sendTransaction
      expect(value).to eq "__"
    end
  end

  context "request for eth_sendRawTransaction " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_sendRawTransaction
      expect(value).to eq "__"
    end
  end

  context "request for eth_call " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_call
      expect(value).to eq "__"
    end
  end

  context "request for eth_estimateGas " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_estimateGas
      expect(value).to eq "__"
    end
  end

  context "request for eth_getBlockByHash " do
    it "returns an Object" do
      vt = VtadaRPC. new
      value = vt. eth_getBlockByHash("0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9")
      expect(value).to be_an Object
    end
  end

  context "request for eth_getBlockByNumber " do
    it "returns an Object" do
      vt = VtadaRPC. new
      value = vt. eth_getBlockByNumber(3267552, false)
      expect(value).to be_an Object
    end
  end

  context "request for eth_getTransactionByHash " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getTransactionByHash
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionByBlockHashAndIndex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getTransactionByBlockHashAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionByBlockNumberAndIndex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getTransactionByBlockNumberAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionReceipt " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getTransactionReceipt
      expect(value).to eq "__"
    end
  end

  context "request for eth_getUncleByBlockHashAndIndex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getUncleByBlockHashAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getUncleByBlockNumberAndIndex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getUncleByBlockNumberAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getCompilers " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getCompilers
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileLLL " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_compileLLL
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileSolidity " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_compileSolidity
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileSerpent " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_compileSerpent
      expect(value).to eq "__"
    end
  end

  context "request for eth_newFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_newFilter
      expect(value).to eq "__"
    end
  end

  context "request for eth_newBlockFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_newBlockFilter
      expect(value).to eq "__"
    end
  end

  context "request for eth_newPendingTransactionFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_newPendingTransactionFilter
      expect(value).to eq "__"
    end
  end

  context "request for eth_uninstallFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_uninstallFilter
      expect(value).to eq "__"
    end
  end

  context "request for eth_getFilterChanges " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getFilterChanges
      expect(value).to eq "__"
    end
  end

  context "request for eth_getFilterLogs " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getFilterLogs
      expect(value).to eq "__"
    end
  end

  context "request for eth_getLogs " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getLogs
      expect(value).to eq "__"
    end
  end

  context "request for eth_getWork " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_getWork
      expect(value).to eq "__"
    end
  end

  context "request for eth_submitWork " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_submitWork
      expect(value).to eq "__"
    end
  end

  context "request for eth_submitHashrate " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. eth_submitHashrate
      expect(value).to eq "__"
    end
  end

  context "request for db_putString " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. db_putString
      expect(value).to eq "__"
    end
  end

  context "request for db_getString " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. db_getString
      expect(value).to eq "__"
    end
  end

  context "request for db_putHex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. db_putHex
      expect(value).to eq "__"
    end
  end

  context "request for db_getHex " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. db_getHex
      expect(value).to eq "__"
    end
  end

  context "request for shh_post " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_post
      expect(value).to eq "__"
    end
  end

  context "request for shh_version " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_version
      expect(value).to eq "__"
    end
  end

  context "request for shh_newIdentity " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_newIdentity
      expect(value).to eq "__"
    end
  end

  context "request for shh_hasIdentity " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_hasIdentity
      expect(value).to eq "__"
    end
  end

  context "request for shh_newGroup " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_newGroup
      expect(value).to eq "__"
    end
  end

  context "request for shh_addToGroup " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_addToGroup
      expect(value).to eq "__"
    end
  end

  context "request for shh_newFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_newFilter
      expect(value).to eq "__"
    end
  end

  context "request for shh_uninstallFilter " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_uninstallFilter
      expect(value).to eq "__"
    end
  end

  context "request for shh_getFilterChanges " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_getFilterChanges
      expect(value).to eq "__"
    end
  end

  context "request for shh_getMessages " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. shh_getMessages
      expect(value).to eq "__"
    end
  end
end
