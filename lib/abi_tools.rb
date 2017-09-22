require "digest/sha3"
require "JSON"
require "set"

class Integer
  def to_padded_hex_string(padding = 64)
    out = sprintf("%0" + String(padding) + "x",self)
        # HACK: For negative numbers, the above command sets "out" to something out like "..fffffff8a432eb"
        # No idea why the "..", seems to be a Ruby thing. For now, just swapping the .'s for f's. #TODO.BW
    out.gsub(".","f") # /HACK
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
    abi.each do |obj|
      if obj["type"] == "function" then
        inputs = obj["inputs"].map {|input| input["type"]}
        method = obj["name"] + "(" + inputs.join(",") + ")"
        @contractMethods.add method
      end
    end
  end

  def self.encode_byte_arrays(bytes)
    data = [bytes.length.to_padded_hex_string]
    z = 64 #used to ensure proper zero padding
    bytes.each do |b|
      data << sprintf("%0x", b)
      z = z - 2
      if z < 0 then
        z = 64
      end
    end
    data << sprintf("%0" + String(z) + "x", 0)
    data.join
  end


  def self.encode_strings(strings)
    data = []
    if strings.length > 1 then
      data << [strings.length.to_padded_hex_string]
    end
    for str in strings do
      data << [encode_byte_arrays([str.bytes])[:data]]
    end
#    return {:arg_type => "STATIC",
#            :data = > data }
    data.join
  end
  #encode_bytes
  #encode_address
  #encode_function
  #encode_uint
  #encode_int
  #encode_fixed
  #encode_ufixed
  #encode_bool

  def encode_single(arg, value)
    len = arg.scan(/\d/).join
    length = len.empty? ? 32 : Integer(len)

    if arg.start_with "string" then
      raise "not yet implemented"
    elsif arg.start_with "bytes" then
      if len.empty? then #if there are no digets in the arg strin
        raise "not yet implemented"
      end
    elsif arg.start_with "address" then
      tailParts << Integer(value).to_padded_hex_string 160
    elsif arg.start_with "function" then
      raise "not yet implemented"
    elsif arg.start_with "uint" then
      tailParts << Integer(value).to_padded_hex_string length
    elsif arg.start_with "int" then
      tailParts << Integer(value).to_padded_hex_string length
    elsif arg.start_with "fixed" then
      raise "not yet implemented"
    elsif arg.start_with "ufixed" then
      raise "not yet implemented"
    elsif arg.start_with "bool" then
      if value then
        headParts << 1.to_padded_hex_string
      else
        headParts << 1.to_padded_hex_string
      end
    end
  end

  def encode_multiple(arg, value)
    headParts = []
    tailParts = []
  end

  #methodstr looks something like "put(bytes32,string)"
  # see https://github.com/ethereum/wiki/wiki/Ethereum-Contract-ABI#types for possible types
  def call(methodstr, arguments)
    if @contractMethods.include? methodstr then
      encodedCallParts = ["0x",methodstr.signature]
      openParen = methodstr.index("(")
      closeParen = methodstr.index(")")
      args = methodstr[openParen, closeParen].split(",")

      arg.zip arguments do |arg, value| #go through arguments and add them to the encoded transaction call
        isTypeArray = arg.end_with? "[]"
        if !isTypeArray then
          if value.kind_of? Array then
            raise ArgumentError, "Was not expecting " + arg + " paramater to be an array."
          end
          encodedCallParts += encode_single(arg,value)
        elsif !value.kind_of? Array then
          raise ArgumentError, "Was expecting " + arg + " parameter to be an array."
        else
          encodedCallParts += encode_multiple(arg,value)
        end
      end
      puts encodedCall
    else
      raise "No method signature " + methodstr + " found"
    end
  end
end

def loadJSONFile(path)
  file = File.read(path)
  parsed = JSON.parse file
  abi = parsed["abi"]
  ContractModel.new abi
  #model = ContractModel.new abi
  #model.call("put(bytes32,string)",["0xAAAAAA","This is a test"])
end

def loadAbiFile(path)
  lines = open(path, &:read).split("\n")
  lines = lines.drop(2)
  jsonStr = lines.join("\n")
  abi = JSON.parse jsonStr
  ContractModel.new abi
end

#Keccak hash

#loadAbiFile "KeyValueStore.abi"

#sprintf("%02X", 10)
#puts(44.to_padded_hex_string())
#puts("baz(uint32,bool)".signature())
