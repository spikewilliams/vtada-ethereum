funcs = open("funcs.txt")

patterns = {-1:"""
    %s
    def %s()
      raise NotImplementedError.new "JSON-RPC call to %s is not currently supported"
    end""",
    0:"""
    %s
    def %s()
      response = do_request("%s")
      %s
    end""",
      1:"""
    %s
    def %s(%s)
      response = do_request("%s",%s)
      %s
    end"""
}

comments = {"personal_unlockAccount": """
    # For web3 personal api
    # Be careful with this method. Do not leave an account unlocked, as that creates
    # an opportunity for an attacker to make transactions from that account. In general
    # personal_signAndSendTransaction is a better option than unlock -> send -> lock"""}


def buildComment(name):
    if name in comments:
        return comments[name]

    if name.startswith("personal_"):
        return "# For web3 personal api - not activated by default in geth"
    return("# See https://github.com/ethereum/wiki/wiki/JSON-RPC#%s" % (name.lower()))

print("module GeneratedWeb3Methods")
for line in funcs.readlines():
  tokes = line.strip().split("|")
  name = tokes.pop(0)
  comment = buildComment(name)
  pattern_index = 0
  return_line = 'response["result"]'
  args = [comment,name,name]
  if len(tokes) > 0:
    pattern_index = int(tokes.pop(0).strip())
  if len(tokes) > 0 and tokes[0] == "D":
    return_line =  "to_decimal " + return_line
    tokes.pop(0)
  if len(tokes) > 0:
    args = [comment] + tokes
    args = [name if x=="$NAME" else x for x in args]

  if pattern_index >= 0:
    args = args + [return_line]
  print(patterns[pattern_index] % tuple(args))
print("end")
