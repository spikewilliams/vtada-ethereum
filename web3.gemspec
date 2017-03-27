Gem::Specification.new do |s|
  s.name        = 'web3'
  s.version     = '0.2.1'
  s.date        = '2017-03-27'
  s.summary     = "A client library for connecting to an Ethereum Web3 JSON RPC service"
  s.description = s.summary
  s.authors     = ["Spike Williams"]
  s.email       = 'spikewilliams@gmail.com'
  s.files       = ["lib/web3.rb", "lib/generated_web3_methods.rb"]
  s.homepage    = 'https://github.com/spikewilliams/vtada-ethereum'
  s.license       = 'MIT'

  s.add_development_dependency "hanna-nouveau", '=> 1.0.1'
  s.add_runtime_dependency "httparty", '=> 0.14.0'
  s.add_runtime_dependency "json", '>= 1.4'
end
