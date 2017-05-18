module Web3::TxpoolCalls

    # See https://github.com/ethereum/wiki/wiki/JSON-RPC#txpool_status
  def txpool_status()
  response = do_request("txpool_status")
  response["result"]
  end

end
