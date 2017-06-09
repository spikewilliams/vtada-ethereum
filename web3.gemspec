Gem::Specification.new do |s|
  s.name        = 'web3'
  s.version     = '0.4.1'
  s.date        = '2017-06-07'
  s.summary     = "A client library for connecting to an Ethereum Web3 JSON RPC service"
  s.description = s.summary
  s.authors     = ["Spike Williams"]
  s.email       = 'spikewilliams@gmail.com'
  s.files       = ["lib/web3.rb",
                    "lib/eth_calls.rb",
                    "lib/miner_calls.rb",
                    "lib/net_calls.rb",
                    "lib/personal_calls.rb",
                    "lib/shh_calls.rb",
                    "lib/txpool_calls.rb",
                    "lib/web3_calls.rb"
                  ]
  s.homepage    = 'https://github.com/spikewilliams/vtada-ethereum'
  s.license       = 'MIT'

  s.add_development_dependency "hanna-nouveau", '~> 1.0'
  s.add_runtime_dependency "httparty", '~> 0.14'
  s.add_runtime_dependency "json", '~> 2'
end
