require "web3"
require "abi_tools"

RSpec.describe "KeyValueStore" do

  KVETH_ACCOUNT = ENV["KVETH_ACCOUNT"] || "0x034e7c56c10e9fd79bd089ec0849ec69ee23cebb"
  KVETH_CONTRACT_ADDRESS = ENV["KVETH_ACCOUNT"] || "0xf8ff3fd84d4270423ce4a999c6bd8e722e026ff7"

  context "Connect to chain" do
    it "connect to a node and have it return the web3 client version" do
      vt = Web3. new
      value = vt. web3_clientVersion
      expect(value).to be_a String
    end
  end

  context "ABI Tools " do
    it "integers pad correctly" do
      padded = 32.to_padded_hex_string 16
      expect(padded).to eq("0000000000000020")
      padded = (-123456789).to_padded_hex_string 16
      expect(padded).to eq("fffffffff8a432eb")
    end
    it "correctly encodes a method signature" do
      sig = "baz(uint32,bool)".signature()
      expect(sig).to eq("cdcd77c0")
    end
    it "encodes byte array" do
      bytes = "Hello, world!".bytes
      encoded = ContractModel.encode_byte_arrays(bytes)
      hw = "000000000000000000000000000000000000000000000000000000000000000d" +
           "48656c6c6f2c20776f726c642100000000000000000000000000000000000000"
  #    expect(encoded.length).to eq hw.length
      expect(encoded).to eq(hw)
    end
    it "load ABI from JSON file" do
      path = "../../smart_tulips/dev/kveth/kveth/build/contracts/KeyValueStore.json"
      model = loadJSONFile path
    #  puts model
    #  value = model.call("put(bytes32,string)",["0xAAAAAA","This is a test"])
    #  puts value
    end
    it "load ABI from ABI file" do
      path = "spec/test.abi"
    #  puts File.basename(Dir.getwd)
      model = loadAbiFile path
  #    puts model
#      value = model.call("put(bytes32,string)",["0xAAAAAA","This is a test"])
#      puts value
    end

  end
end
