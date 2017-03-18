require_relative "../web3"

RSpec.describe Web3 do

#
#
  ETH_ACCOUNTS = (ENV["ETH_ACCOUNTS"] ||
            "0xdd8faf0c8999ccfe8f3a66d45ce7060c49161d16,0xbf2f3263d0697cd52ec07ac3cb386438427fea9b,0x0d89aff7c5bb18f3a797715a0eff69496c3f8ec1").split(",")

  context "request for web3_clientVersion " do
    it "is a String" do
      vt = Web3. new
      value = vt. web3_clientVersion
      expect(value).to be_a(String)
    end
  end

  context "request for web3_sha3 0x123456" do
    it "returns 0x6adf031833174bbe4c85eafe59ddb54e6584648c2c962c6f94791ab49caa0ad4" do
      vt = Web3. new
      value = vt. web3_sha3 "0x123456"
      expect(value).to eq "0x6adf031833174bbe4c85eafe59ddb54e6584648c2c962c6f94791ab49caa0ad4"
    end
  end

  context "request for net_version " do
    it "is a String" do
      vt = Web3. new
      value = vt. net_version
      expect(value).to be_a(String)
    end
  end

  context "request for net_peerCount " do
    it "is an Integer" do
      vt = Web3. new
      value = vt. net_peerCount
      expect(value).to be_a(Integer)
    end
  end

  context "request for net_listening " do
    it "returns true" do
      vt = Web3. new
      value = vt. net_listening
      expect(value).to eq true
    end
  end

  context "request for eth_protocolVersion " do
    it "exists" do
      vt = Web3. new
      value = vt. eth_protocolVersion
      expect(value).to exists
    end
  end

  context "request for eth_syncing " do
    it "is true or false" do
      vt = Web3. new
      value = vt. eth_syncing
      expect(value === true || value === false).to eq true
    end
  end

  #this is not implemented in the light geth client, and it throws an error
  context "request for eth_coinbase " do
    it "exists" do
      vt = Web3. new
      value = vt. eth_coinbase
      expect(value).to exist
    end
  end

  context "request for eth_mining " do
    it "is true or false" do
      vt = Web3. new
      value = vt. eth_mining
      expect(value === true || value === false).to eq true
    end
  end

  context "request for eth_hashrate " do
    it "returns 0" do
      vt = Web3. new
      value = vt. eth_hashrate
      expect(value).to eq 0
    end
  end

  context "request for eth_gasPrice " do
    it "returns value > 1000" do
      vt = Web3. new
      value = vt. eth_gasPrice
      expect(value).to be > 1000
    end
  end

  context "request for eth_accounts " do
    it "returns Array" do
      vt = Web3. new
      value = vt. eth_accounts
      expect(value).to be_an_instance_of Array
    end
  end

  context "request for eth_blockNumber " do
    it "returns an Integer" do
      vt = Web3. new
      value = vt. eth_blockNumber
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getBalance " do
    it "returns an Integer" do
      vt = Web3. new ETH_ACCOUNTS[0]
      value = vt. eth_getBalance
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getStorageAt " do
    it "returns 0x0000000000000000000000000000000000000000000000000000000000000000" do
      vt = Web3. new
      value = vt. eth_getStorageAt("0x295a70b2de5e3953354a6a8344e616ed314d7251",0)
      expect(value).to eq "0x0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  context "request for eth_getTransactionCount" do
    it "returns an Integer" do
      vt = Web3. new
      value = vt. eth_getTransactionCount(new ETH_ACCOUNTS[0],"latest")
      expect(value).to be_an Integer
    end
  end

  context "request for eth_getBlockTransactionCountByHash 0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9" do
    it "returns 16" do
      vt = Web3. new
      value = vt. eth_getBlockTransactionCountByHash("0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9")
      expect(value).to eq 16
    end
  end

  context "request for eth_getBlockTransactionCountByNumber 3267552" do
    it "returns 16" do
      vt = Web3. new
      value = vt. eth_getBlockTransactionCountByNumber 3267552
      expect(value).to eq 16
    end
  end

  context "request for eth_getUncleCountByBlockHash 0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9" do
    it "returns 0" do
      vt = Web3. new
      value = vt. eth_getUncleCountByBlockHash "0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9"
      expect(value).to eq 0
    end
  end

  context "request for eth_getUncleCountByBlockNumber 3267552" do
    it "returns 3267552" do
      vt = Web3. new
      value = vt. eth_getUncleCountByBlockNumber 3267552
      expect(value).to eq 0
    end
  end

  context "request for eth_getCode 0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b" do
    it "returns an Object" do
      vt = Web3. new
      value = vt. eth_getCode("0xa94f5374fce5edbc8e2a8697c15331677e6ebf0b",2)
      expect(value).to be_an Object
    end
  end

  context "request for eth_sign " do
    it "returns String" do
      vt = Web3. new "0x14226aD04625ED4930787D87C82c6c72a5B690a1"
      value = vt. eth_sign "0xdeadbeaf"
      expect(value).to be_a String
    end
  end

  context "request for eth_sendTransaction " do
    it "returns String" do
      vt = Web3. new
      trans = {}
      trans["from"] = ETH_ACCOUNTS[0]
      trans["to"] = ETH_ACCOUNTS[1]
      trans["data"] = "6060604052341561000c57fe5b6040516102fe3803806102fe83398101604052" +
                      "8080518201919050505b5b33600060006101000a81548173ffffffffffffffff" +
                      "ffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffff" +
                      "ffffffffffff1602179055505b80600190805190602001906100829291906100" +
                      "8a565b505b5061012f565b828054600181600116156101000203166002900490" +
                      "600052602060002090601f016020900481019282601f106100cb57805160ff19" +
                      "168380011785556100f9565b828001600101855582156100f9579182015b8281" +
                      "11156100f85782518255916020019190600101906100dd565b5b509050610106" +
                      "919061010a565b5090565b61012c91905b808211156101285760008160009055" +
                      "50600101610110565b5090565b90565b6101c08061013e6000396000f3006060" +
                      "6040526000357c01000000000000000000000000000000000000000000000000" +
                      "00000000900463ffffffff16806341c0e1b514610046578063cfae3217146100" +
                      "58575bfe5b341561004e57fe5b610056610086565b005b341561006057fe5b61" +
                      "006861011a565b60405180826000191660001916815260200191505060405180" +
                      "910390f35b600060009054906101000a900473ffffffffffffffffffffffffff" +
                      "ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373" +
                      "ffffffffffffffffffffffffffffffffffffffff161415610117576000600090" +
                      "54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff" +
                      "ffffffffffffffffffffffffffffffffffffff16ff5b5b565b60006001426040" +
                      "51808380546001816001161561010002031660029004801561017a5780601f10" +
                      "61015857610100808354040283529182019161017a565b820191906000526020" +
                      "600020905b815481529060010190602001808311610166575b50508281526020" +
                      "0192505050604051809103902090505b905600a165627a7a723058203c8b6e5a" +
                      "ad3868b193070dcc212d79e4215bf3bc72abe172c76009d28fa331650029"

#      if value != nil
#        trans["value"] = to_hex(value)
#      end
#      if gas != nil
#        trans["gas"] = to_hex(gas)
#      end
#      if gasPrice != nil
#        trans["gasPrice"] = to_hex(gasPrice)
#      end
#      if nonce != nil
#        trans["nonce"] = to_hex(nonce)
#      end
      value = vt. eth_sendTransaction trans
      expect(value).to be_a(String)
    end
  end

  context "request for eth_sendRawTransaction " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_sendRawTransaction
      expect(value).to eq "__"
    end
  end

  context "request for eth_call " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_call
      expect(value).to eq "__"
    end
  end

  context "request for eth_estimateGas " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_estimateGas
      expect(value).to eq "__"
    end
  end

  context "request for eth_getBlockByHash " do
    it "returns an Object" do
      vt = Web3. new
      value = vt. eth_getBlockByHash("0x1ccad42c813d25feb8ea8a33cf3fa408196242ec27462d39b90f57c58c0ea5c9")
      expect(value).to be_an Object
    end
  end

  context "request for eth_getBlockByNumber " do
    it "returns an Object" do
      vt = Web3. new
      value = vt. eth_getBlockByNumber(3267552, false)
      expect(value).to be_an Object
    end
  end

  context "request for eth_getTransactionByHash " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getTransactionByHash
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionByBlockHashAndIndex " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getTransactionByBlockHashAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionByBlockNumberAndIndex " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getTransactionByBlockNumberAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getTransactionReceipt " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getTransactionReceipt
      expect(value).to eq "__"
    end
  end

  context "request for eth_getUncleByBlockHashAndIndex " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getUncleByBlockHashAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getUncleByBlockNumberAndIndex " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getUncleByBlockNumberAndIndex
      expect(value).to eq "__"
    end
  end

  context "request for eth_getCompilers " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getCompilers
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileLLL " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_compileLLL
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileSolidity " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_compileSolidity
      expect(value).to eq "__"
    end
  end

  context "request for eth_compileSerpent " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_compileSerpent
      expect(value).to eq "__"
    end
  end

  context "request for eth_newFilter " do
    it "returns Integer" do
      vt = Web3. new
      value = vt. eth_newFilter
      expect(value).to be_an Integer
    end
  end

  context "request for eth_newBlockFilter " do
    it "returns Integer" do
      vt = Web3. new
      value = vt. eth_newBlockFilter
      expect(value).to  be_an Integer
    end
  end

  context "request for eth_newPendingTransactionFilter " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_newPendingTransactionFilter
      expect(value).to eq "__"
    end
  end

  context "request for eth_uninstallFilter " do
    it "returns Boolean" do
      vt = Web3. new
      value = vt. eth_uninstallFilter
      expect(value).to be_a Boolean
    end
  end

  context "request for eth_getFilterChanges " do
    it "returns Array" do
      vt = Web3. new
      value = vt. eth_getFilterChanges
      expect(value).to be_an Array
    end
  end

  context "request for eth_getFilterLogs " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getFilterLogs
      expect(value).to eq "__"
    end
  end

  context "request for eth_getLogs " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. eth_getLogs
      expect(value).to eq "__"
    end
  end

  context "request for eth_getWork " do
    it "returns Array" do
      vt = Web3. new
      value = vt. eth_getWork
      expect(value).to be_an Array
    end
  end

  context "request for eth_submitWork " do
    it "returns Boolean" do
      vt = Web3. new
      value = vt. eth_submitWork
      expect(value).to be_a Boolean
    end
  end

  context "request for eth_submitHashrate " do
    it "returns Boolean" do
      vt = Web3. new
      value = vt. eth_submitHashrate
      expect(value).to be_a Boolean
    end
  end

  context "request for shh_version " do
    it "returns String" do
      vt = Web3. new
      value = vt. shh_version
      expect(value).to  be_a String
    end
  end

  context "request for shh_post " do
      it "returns Boolean" do
        vt = Web3. new
        value = vt. shh_post
        expect(value).to be_a Boolean
      end
    end

  context "request for shh_newIdentity " do
    it "returns String" do
      vt = Web3. new
      value = vt. shh_newIdentity
      expect(value).to be_a String
    end
  end

  context "request for shh_hasIdentity " do
    it "returns Boolean" do
      vt = Web3. new
      value = vt. shh_hasIdentity "0x04f96a5e25610293e42a73908e93ccc8c4d4dc0edcfa9fa872f50cb214e08ebf61a03e245533f97284d442460f2998cd41858798ddfd4d661997d3940272b717b1"
      expect(value).to be_a Boolean
    end
  end

  context "request for shh_newGroup " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. shh_newGroup
      expect(value).to eq "__"
    end
  end

  context "request for shh_addToGroup " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. shh_addToGroup
      expect(value).to eq "__"
    end
  end

  context "request for shh_newFilter " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. shh_newFilter
      expect(value).to eq "__"
    end
  end

  context "request for shh_uninstallFilter " do
    it "TEST NOT IMPLEMENTED" do
      vt = Web3. new
      value = vt. shh_uninstallFilter
      expect(value).to eq "__"
    end
  end

  context "request for shh_getFilterChanges " do
    it "returns Array" do
      vt = Web3. new
      value = vt. shh_getFilterChanges
      expect(value).to be_an Array
    end
  end

  context "request for shh_getMessages " do
    it "returns Array" do
      vt = Web3. new
      value = vt. shh_getMessages
      expect(value).to be_an Array
    end
  end
end
