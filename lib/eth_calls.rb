module Web3::EthCalls

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

  # Sends a transaction for posting to the ethereum network. The transaction_object
  # that is sent should look something like this:
  #
  #  {"from"=> accounts[0],  "to" => accounts[1],  "value" => w3.ether_to_0xwei(0.001)}
  #
  # Other 0x-fomatted attributes that can be included in the transaction_object are:
  #    "data"                                  : formatted as hex
  #    "gas", "gasPrice", "value", and "nonce" : formatted as "0x" + hex
  #
  # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendtransaction
  def eth_sendTransaction(transaction_object)
    response = do_request("eth_sendTransaction",[transaction_object])
    response["result"]
  end

  # Returns pending transactions that belong to any of the users accounts
  # See https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console#ethpendingtransactions
  def eth_pendingTransactions()
    response = do_request("eth_pendingTransactions")
    response["result"]
  end

  # Resends a transaction. These can ge retrieved from eth_pendingTransactions().
  # gasPrice and gasLimit can be included together if the gas settings are being changed from
  # their original settings in the pending_transaction object
  # See https://github.com/ethereum/go-ethereum/wiki/JavaScript-Console#ethresend
  def eth_resend(pending_transaction, gasPrice=nil, gasLimit=nil)
    package = [pending_transaction]
    if gasPrice != nil
      package += [gasPrice, gasLimit]
    end
    response = do_request("eth_resend", package)
    response["result"]
  end

  # This sends a transaction that looks something like this:
  # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_sendrawtransaction
  def eth_sendRawTransaction(data)
    response = do_request("eth_sendRawTransaction",[data])
    response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_call
  def eth_call(trans_object,block="latest")
    response = do_request("eth_call",[trans_object, block])
    response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_estimategas
  def eth_estimateGas(trans_object)
    response = do_request("eth_estimateGas",[trans_object])
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

    # deprecated
    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_getcompilers
  def eth_getCompilers()
  response = do_request("eth_getCompilers")
  response["result"]
  end

    #deprecated
    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilelll
  def eth_compileLLL(code)
  response = do_request("eth_compileLLL",[code])
  response["result"]
  end

    # deprecated
    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#eth_compilesolidity
  def eth_compileSolidity(code)
  response = do_request("eth_compileSolidity",[code])
  response["result"]
  end

    # deprecated
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
end
