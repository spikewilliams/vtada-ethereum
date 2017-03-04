funcs = open("funcs.txt")

patterns = {-1:""" %s % s""",
    0:"""
  context "request for %s " do
    it "returns ___" do
      vt = VtadaRPC. new
      value = vt. %s
      expect(value).to eq "__"
    end
  end"""
}

print('require "vtada_rpc"')
print("RSpec.describe VtadaRPC do")
for line in funcs.readlines():
  tokes = line.strip().split("|")
  name = tokes.pop(0)
  pattern_index = 0
  args = [name,name]
  print(patterns[pattern_index] % tuple(args))
print("end")
