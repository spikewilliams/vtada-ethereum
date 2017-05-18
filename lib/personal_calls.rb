module Web3::PersonalCalls

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_listaccounts
  def personal_listAccounts()
  response = do_request("personal_listAccounts")
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_importrawkey
  def personal_importRawKey(key, passphrase)
  response = do_request("personal_importRawKey",[key, passphrase])
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_newaccount
  def personal_newAccount(password)
  response = do_request("personal_newAccount",[password])
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_signandsendtransaction
  def personal_signAndSendTransaction(transaction, passphrase)
  response = do_request("personal_signAndSendTransaction",[transaction, passphrase])
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_lockaccount
  def personal_lockAccount(account)
  response = do_request("personal_lockAccount",[account])
  response["result"]
  end


  # Be careful with this method. Do not leave an account unlocked, as that creates
  # an opportunity for an attacker to make transactions from that account. In general
  # personal_signAndSendTransaction is a better option than unlock -> send -> lock
    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_unlockaccount
  def personal_unlockAccount(account, passphrase, duration)
  response = do_request("personal_unlockAccount",[account, passphrase, duration])
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_sign
  def personal_sign(message, account, password)
  response = do_request("personal_sign",[message, account, password])
  response["result"]
  end

    # See https://github.com/ethereum/go-ethereum/wiki/Management-APIs#personal_ecrecover
  def personal_ecRecover(message, signature)
  response = do_request("personal_ecRecover",[message, signature])
  response["result"]
  end

end
