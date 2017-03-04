funcs = open("funcs.txt")

patterns = {-1:"""
    def %s()
      raise NotImplementedError.new "JSON-RPC call to %s is not currently supported"
    end""",
    0:"""
    def %s()
      response = do_request("%s")
      %s
    end""",
      1:"""
    def %s(%s)
      response = do_request("%s",%s)
      %s
    end"""
}

print("module GeneratedWeb3Methods")
for line in funcs.readlines():
  tokes = line.strip().split("|")
  name = tokes.pop(0)
  pattern_index = 0
  return_line = 'response["result"]'
  args = [name,name]
  if len(tokes) > 0:
    pattern_index = int(tokes.pop(0).strip())
  if len(tokes) > 0 and tokes[0] == "D":
    return_line =  "to_decimal " + return_line
    tokes.pop(0)
  if len(tokes) > 0:
    args = tokes
    args = [name if x=="$NAME" else x for x in args]

  if pattern_index >= 0:
    args = args + [return_line]
  print(patterns[pattern_index] % tuple(args))
print("end")
