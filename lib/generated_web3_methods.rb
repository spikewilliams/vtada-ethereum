module GeneratedWeb3Methods

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_clientversion
    def web3_clientVersion()
      response = do_request("web3_clientVersion")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#web3_sha3
    def web3_sha3(data)
      response = do_request("web3_sha3",[data])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#net_version
    def net_version()
      response = do_request("net_version")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#net_peercount
    def net_peerCount()
      response = do_request("net_peerCount")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#net_listening
    def net_listening()
      response = do_request("net_listening")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_protocolversion
    def eth_protocolVersion()
      raise NotImplementedError.new "JSON-RPC call to eth_protocolVersion is not currently supported"
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_syncing
    def eth_syncing()
      response = do_request("eth_syncing")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_coinbase
    def eth_coinbase()
      response = do_request("eth_coinbase")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_mining
    def eth_mining()
      response = do_request("eth_mining")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_hashrate
    def eth_hashrate()
      response = do_request("eth_hashrate")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gasprice
    def eth_gasPrice()
      response = do_request("eth_gasPrice")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_accounts
    def eth_accounts()
      response = do_request("eth_accounts")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_blocknumber
    def eth_blockNumber()
      response = do_request("eth_blockNumber")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getbalance
    def eth_getBalance(address, block = "latest")
      response = do_request("eth_getBalance",[address, block])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getstorageat
    def eth_getStorageAt(storage_address, position, block = "latest")
      response = do_request("eth_getStorageAt",[storage_address, to_hex(position), block])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactioncount
    def eth_getTransactionCount(address, block = "latest")
      response = do_request("eth_getTransactionCount",[address, block])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbyhash
    def eth_getBlockTransactionCountByHash(data)
      response = do_request("eth_getBlockTransactionCountByHash",[data])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblocktransactioncountbynumber
    def eth_getBlockTransactionCountByNumber(block = "latest")
      response = do_request("eth_getBlockTransactionCountByNumber",[block])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblockhash
    def eth_getUncleCountByBlockHash(data)
      response = do_request("eth_getUncleCountByBlockHash",[data])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclecountbyblocknumber
    def eth_getUncleCountByBlockNumber(data)
      response = do_request("eth_getUncleCountByBlockNumber",[data])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcode
    def eth_getCode(address, block = "latest")
      response = do_request("eth_getCode",[address, block])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sign
    def eth_sign(address, data)
      response = do_request("eth_sign",[address, data])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction
    def eth_sendTransaction(trans_object)
      response = do_request("eth_sendTransaction",[trans_object])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction
    def eth_sendRawTransaction(data)
      response = do_request("eth_sendRawTransaction",[data])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call
    def eth_call(trans_object,block)
      response = do_request("eth_call",[trans_object, block])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas
    def eth_estimateGas(trans_object,block)
      response = do_request("eth_estimateGas",[trans_object, block])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbyhash
    def eth_getBlockByHash(hash, full_transactions = true)
      response = do_request("eth_getBlockByHash",[hash, full_transactions])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getblockbynumber
    def eth_getBlockByNumber(number, full_transactions = true)
      response = do_request("eth_getBlockByNumber",[number, full_transactions])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyhash
    def eth_getTransactionByHash(hash)
      response = do_request("eth_getTransactionByHash",[hash])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblockhashandindex
    def eth_getTransactionByBlockHashAndIndex(hash, index)
      response = do_request("eth_getTransactionByBlockHashAndIndex",[hash, index])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionbyblocknumberandindex
    def eth_getTransactionByBlockNumberAndIndex(number, index)
      response = do_request("eth_getTransactionByBlockNumberAndIndex",[number, index])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_gettransactionreceipt
    def eth_getTransactionReceipt(hash)
      response = do_request("eth_getTransactionReceipt",[hash])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblockhashandindex
    def eth_getUncleByBlockHashAndIndex(hash, index)
      response = do_request("eth_getUncleByBlockHashAndIndex",[hash, index])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getunclebyblocknumberandindex
    def eth_getUncleByBlockNumberAndIndex(number, index)
      response = do_request("eth_getUncleByBlockNumberAndIndex",[number, index])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers
    def eth_getCompilers()
      response = do_request("eth_getCompilers")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilelll
    def eth_compileLLL(code)
      response = do_request("eth_compileLLL",[code])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilesolidity
    def eth_compileSolidity(code)
      response = do_request("eth_compileSolidity",[code])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compileserpent
    def eth_compileSerpent(code)
      response = do_request("eth_compileSerpent",[code])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newfilter
    def eth_newFilter(fromBlock, toBlock, address, topics)
      response = do_request("$CODE",[fromBlock, toBlock, address, topics])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newblockfilter
    def eth_newBlockFilter()
      response = do_request("eth_newBlockFilter")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_newpendingtransactionfilter
    def eth_newPendingTransactionFilter()
      response = do_request("eth_newPendingTransactionFilter")
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_uninstallfilter
    def eth_uninstallFilter(id)
      response = do_request("eth_uninstallFilter",[id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterchanges
    def eth_getFilterChanges(id)
      response = do_request("eth_getFilterChanges",[id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getfilterlogs
    def eth_getFilterLogs(id)
      response = do_request("eth_getFilterLogs",[id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getlogs
    def eth_getLogs(filter_obj)
      response = do_request("eth_getLogs",[filter_obj])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getwork
    def eth_getWork()
      response = do_request("eth_getWork")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submitwork
    def eth_submitWork(nonce, powHash, mixDigest)
      response = do_request("eth_submitWork",[nonce, powHash, mixDigest])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_submithashrate
    def eth_submitHashrate(hashrate, id)
      response = do_request("eth_submitHashrate",[hashrate, id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_version
    def shh_version()
      response = do_request("shh_version")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_post
    def shh_post(post_object)
      response = do_request("shh_post",[post_object])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newidentity
    def shh_newIdentity()
      response = do_request("shh_newIdentity")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_hasidentity
    def shh_hasIdentity(address)
      response = do_request("shh_hasIdentity",[address])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newgroup
    def shh_newGroup()
      response = do_request("shh_newGroup")
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_addtogroup
    def shh_addToGroup(address)
      response = do_request("shh_addToGroup",[address])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_newfilter
    def shh_newFilter(filter_object)
      response = do_request("shh_newFilter",[filter_object])
      to_decimal response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_uninstallfilter
    def shh_uninstallFilter(id)
      response = do_request("shh_uninstallFilter",[id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getfilterchanges
    def shh_getFilterChanges(id)
      response = do_request("shh_getFilterChanges",[id])
      response["result"]
    end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#shh_getmessages
    def shh_getMessages(id)
      response = do_request("shh_getMessages",[id])
      response["result"]
    end
end
