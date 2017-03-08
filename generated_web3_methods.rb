module GeneratedWeb3Methods

    def web3_clientVersion()
      response = do_request("web3_clientVersion")
      response["result"]
    end

    def web3_sha3(data)
      response = do_request("web3_sha3",[data])
      response["result"]
    end

    def net_version()
      response = do_request("net_version")
      response["result"]
    end

    def net_peerCount()
      response = do_request("net_peerCount")
      to_decimal response["result"]
    end

    def net_listening()
      response = do_request("net_listening")
      response["result"]
    end

    def eth_protocolVersion()
      raise NotImplementedError.new "JSON-RPC call to eth_protocolVersion is not currently supported"
    end

    def eth_syncing()
      response = do_request("eth_syncing")
      response["result"]
    end

    def eth_coinbase()
      response = do_request("eth_coinbase")
      response["result"]
    end

    def eth_mining()
      response = do_request("eth_mining")
      response["result"]
    end

    def eth_hashrate()
      response = do_request("eth_hashrate")
      to_decimal response["result"]
    end

    def eth_gasPrice()
      response = do_request("eth_gasPrice")
      to_decimal response["result"]
    end

    def eth_accounts()
      response = do_request("eth_accounts")
      response["result"]
    end

    def eth_blockNumber()
      response = do_request("eth_blockNumber")
      to_decimal response["result"]
    end

    def eth_getBalance(address = @address, block = "latest")
      response = do_request("eth_getBalance",[address, block])
      to_decimal response["result"]
    end

    def eth_getStorageAt(storage_address, position, block = "latest")
      response = do_request("eth_getStorageAt",[storage_address, to_hex(position), block])
      response["result"]
    end

    def eth_getTransactionCount(address = @address, block = "latest")
      response = do_request("eth_getTransactionCount",[address, block])
      to_decimal response["result"]
    end

    def eth_getBlockTransactionCountByHash(data)
      response = do_request("eth_getBlockTransactionCountByHash",[data])
      to_decimal response["result"]
    end

    def eth_getBlockTransactionCountByNumber(block = "latest")
      response = do_request("eth_getBlockTransactionCountByNumber",[block])
      to_decimal response["result"]
    end

    def eth_getUncleCountByBlockHash(data)
      response = do_request("eth_getUncleCountByBlockHash",[data])
      to_decimal response["result"]
    end

    def eth_getUncleCountByBlockNumber(data)
      response = do_request("eth_getUncleCountByBlockNumber",[data])
      to_decimal response["result"]
    end

    def eth_getCode(address = @address, block = "latest")
      response = do_request("eth_getCode",[address, block])
      response["result"]
    end

    def eth_sign(data, address = @address)
      response = do_request("eth_sign",[address, data])
      response["result"]
    end

    def eth_sendTransaction(trans_object)
      response = do_request("eth_sendTransaction",[trans_object])
      response["result"]
    end

    def eth_sendRawTransaction()
      response = do_request("eth_sendRawTransaction")
      response["result"]
    end

    def eth_call()
      response = do_request("eth_call")
      response["result"]
    end

    def eth_estimateGas()
      response = do_request("eth_estimateGas")
      response["result"]
    end

    def eth_getBlockByHash(data, full_transactions = true)
      response = do_request("eth_getBlockByHash",[data, full_transactions])
      response["result"]
    end

    def eth_getBlockByNumber(data, full_transactions = true)
      response = do_request("eth_getBlockByNumber",[data, full_transactions])
      response["result"]
    end

    def eth_getTransactionByHash()
      response = do_request("eth_getTransactionByHash")
      response["result"]
    end

    def eth_getTransactionByBlockHashAndIndex()
      response = do_request("eth_getTransactionByBlockHashAndIndex")
      response["result"]
    end

    def eth_getTransactionByBlockNumberAndIndex()
      response = do_request("eth_getTransactionByBlockNumberAndIndex")
      response["result"]
    end

    def eth_getTransactionReceipt()
      response = do_request("eth_getTransactionReceipt")
      response["result"]
    end

    def eth_getUncleByBlockHashAndIndex()
      response = do_request("eth_getUncleByBlockHashAndIndex")
      response["result"]
    end

    def eth_getUncleByBlockNumberAndIndex()
      response = do_request("eth_getUncleByBlockNumberAndIndex")
      response["result"]
    end

    def eth_getCompilers()
      response = do_request("eth_getCompilers")
      response["result"]
    end

    def eth_compileLLL()
      response = do_request("eth_compileLLL")
      response["result"]
    end

    def eth_compileSolidity()
      response = do_request("eth_compileSolidity")
      response["result"]
    end

    def eth_compileSerpent()
      response = do_request("eth_compileSerpent")
      response["result"]
    end

    def eth_newFilter()
      response = do_request("eth_newFilter")
      response["result"]
    end

    def eth_newBlockFilter()
      response = do_request("eth_newBlockFilter")
      response["result"]
    end

    def eth_newPendingTransactionFilter()
      response = do_request("eth_newPendingTransactionFilter")
      response["result"]
    end

    def eth_uninstallFilter()
      response = do_request("eth_uninstallFilter")
      response["result"]
    end

    def eth_getFilterChanges()
      response = do_request("eth_getFilterChanges")
      response["result"]
    end

    def eth_getFilterLogs()
      response = do_request("eth_getFilterLogs")
      response["result"]
    end

    def eth_getLogs()
      response = do_request("eth_getLogs")
      response["result"]
    end

    def eth_getWork()
      response = do_request("eth_getWork")
      response["result"]
    end

    def eth_submitWork()
      response = do_request("eth_submitWork")
      response["result"]
    end

    def eth_submitHashrate()
      response = do_request("eth_submitHashrate")
      response["result"]
    end

    def db_putString()
      response = do_request("db_putString")
      response["result"]
    end

    def db_getString()
      response = do_request("db_getString")
      response["result"]
    end

    def db_putHex()
      response = do_request("db_putHex")
      response["result"]
    end

    def db_getHex()
      response = do_request("db_getHex")
      response["result"]
    end

    def shh_post()
      response = do_request("shh_post")
      response["result"]
    end

    def shh_version()
      response = do_request("shh_version")
      response["result"]
    end

    def shh_newIdentity()
      response = do_request("shh_newIdentity")
      response["result"]
    end

    def shh_hasIdentity()
      response = do_request("shh_hasIdentity")
      response["result"]
    end

    def shh_newGroup()
      response = do_request("shh_newGroup")
      response["result"]
    end

    def shh_addToGroup()
      response = do_request("shh_addToGroup")
      response["result"]
    end

    def shh_newFilter()
      response = do_request("shh_newFilter")
      response["result"]
    end

    def shh_uninstallFilter()
      response = do_request("shh_uninstallFilter")
      response["result"]
    end

    def shh_getFilterChanges()
      response = do_request("shh_getFilterChanges")
      response["result"]
    end

    def shh_getMessages()
      response = do_request("shh_getMessages")
      response["result"]
    end
end
