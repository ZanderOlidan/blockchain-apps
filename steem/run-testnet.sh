#!/bin/sh

export daemonDir="steem_testnet/steem/build/programs/steemd"
export configFile="steem_testnet/steem/build/programs/steemd/testnet/config.ini"
init() {
    echo "Running initial Steem Testnet..."
    echo "========================================================================"
    echo "\n\n[IMPORTANT] Quit (Ctrl + C) the program after it generates the files\n\n\n"
    echo "========================================================================"
    cd $daemonDir
    ./steemd -d testnet
    cd ../../../../../
}

changeLine() {
    sed -i -e "s/$1/$2/g" $configFile
}

config() {
    stty sane
    read -p "Copy and paste the initminer private key from previous command output: " privKey
    echo "Adding $privKey to testnet configuration..."
    echo "Configuring..."
    changeLine "# witness = " "witness = \"initminer\""
    changeLine "# private-key = " "private-key = $privKey"
    changeLine "# p2p-endpoint = " "p2p-endpoint = 0.0.0.0:3333"
    changeLine "# rpc-endpoint = " "rpc-endpoint = 127.0.0.1:9876"
    echo "Done..."
}


run() {
    echo "Running Steem Testnet..."
    cd $daemonDir
    ./steemd -d testnet --enable-stale-production
}

cli_wallet() {
    echo "Running CLI Wallet..."
    cd $daemonDir
    cd ../programs/cli_wallet
    ./cli_wallet --server-rpc-endpoint="ws://127.0.0.1:9876"
}

$@
