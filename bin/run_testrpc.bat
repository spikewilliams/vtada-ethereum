SET RPCPORT=8545
SET IMAGE_NAME=vtada/testrpc
SET MNEMONIC="the magic rat drove his sleek machine over the jersey state line"

docker run --rm -it -p %RPCPORT%:8545 %IMAGE_NAME% -m %MNEMONIC%
