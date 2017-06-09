module Web3::ShhCalls

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
