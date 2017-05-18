module Web3::NetCalls

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
end
