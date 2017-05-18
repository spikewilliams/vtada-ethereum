module Web3::Web3Calls

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
end
