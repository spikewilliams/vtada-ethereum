require "digest/sha3"
require "JSON"
require "set"

class Integer
  def to_padded_hex_string
    sprintf("%032X",self)
  end
end

class String

  attr_accessor :datatype

  def signature
    Digest::SHA3.hexdigest(self, 256) [0..7]
  end
end

class ContractModel
  attr_reader :contractMethods
  def initialize(abi)
    @contractMethods = Set.new
    for obj in abi
      if obj["type"] == "function" then
        inputs = obj["inputs"].map {|input| input["type"]}
        method = obj["name"] + "(" + inputs.join(",") + ")"
        @contractMethods.add method
      end
    end
  end

  def call(method, arguments)
    if @contractMethods.include? method then
      puts method.signature
    end
  end
end

def loadAbiFile(path)
  lines = open(path, &:read).split("\n")
  abi = JSON.parse lines[2]
  model = ContractModel.new abi
  model.call("put(bytes32,string)",["0xAAAAAA","This is a test"])
end

#Keccak hash

loadAbiFile "KeyValueStore.abi"

sprintf("%02X", 10)
puts("asdfasdfasd")
puts(44.to_padded_hex_string())
puts("hello".signature())
