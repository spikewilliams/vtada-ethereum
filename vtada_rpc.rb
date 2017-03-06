# A client to Ethereum JSON-RPC https://github.com/ethereum/wiki/wiki/JSON-RPC

require "httparty"
require "json"

@method = "eth_getBalance"
@params = ["0x14226aD04625ED4930787D87C82c6c72a5B690a1", "latest"]

class VtadaRPC
  attr_accessor :address, :endpoint, :id, :debug

  @@jsonrpc = "2.0"
  @@debug = ENV["ETH_DEBUG"] || false

  def initialize( address = nil,
                  endpoint = ENV["ETH_ENDPOINT"] || "http://localhost:8545",
                  id = ENV["ETH_DEFAULT_CLIENT_ID"] || 999)
    @address = address
    @endpoint = endpoint
    @id = id
  end

  def do_request(method, params = [], id = @id) #TODO: More error handling
    request_json = { :jsonrpc => @@jsonrpc,
               :method => method,
               :params => params,
               :id => @id
             }.to_json

    if @@debug
      puts "Request to " + @endpoint + ": " + request_json + "  ...."
    end

    response = HTTParty.post(@endpoint,
        :body => request_json,
        :headers => { 'Content-Type' => 'application/json' } )

    if @@debug
      puts "Response: " + response.to_s()
    end

    if response["error"]
      code = response["error"]["code"]
      message = response["error"]["message"]
      raise "In response to " + method + " request, JSON-RPC endpoint returned error #" + code.to_s() + ": " + message
    end
    response
  end

# JSON RPC FUNCTION CALLS INCLUDED HERE
  require_relative "generated_web3_methods.rb"
  include GeneratedWeb3Methods

  require_relative "vtada_rpc_utils.rb"
  include VtadaRPCUtils
end

w3 = VtadaRPC. new "0x14226aD04625ED4930787D87C82c6c72a5B690a1"
#w3.address =
#puts w3. web3_clientVersion
#puts w3. net_version
#puts w3. eth_protocolVersion
#puts "ds"
#puts w3. eth_coinbase #testme
#puts w3. eth_getBlockTransactionCountByNumber 3267552
# w3. eth_getBlockTransactionCountByHash '0xb903239f8543d04b5dc1ba6579132b143087c68db1b2168786408fcbce568238'

#puts w3. eth_blockNumber
#puts w3. eth_mining
#puts w3. eth_getTransactionCount
#puts w3. eth_getBalance
#puts w3. eth_accounts
#puts w3. eth_gasPrice
#puts do_request(@method, @params)
