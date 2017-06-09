module Web3::MinerCalls

  # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_makedag
  def miner_makeDAG(number)
  response = do_request("miner_makeDAG",[number])
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_setextra
  def miner_setExtra(extra)
  response = do_request("miner_setExtra",[extra])
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_setgasprice
  def miner_setGasPrice(gasPrice)
  response = do_request("miner_setGasPrice",[gasPrice])
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_start
  def miner_start(threads)
  response = do_request("miner_start",[threads])
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_startautodag
  def miner_startAutoDAG(number)
  response = do_request("miner_startAutoDAG",[number])
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_stop
  def miner_stop()
  response = do_request("miner_stop")
  response["result"]
  end

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#miner_stopautodag
  def miner_stopAutoDAG()
  response = do_request("miner_stopAutoDAG")
  response["result"]
  end
end
