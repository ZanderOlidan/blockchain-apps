# Steem Testnet Setup

Build and compile Steem with Testnet variable on.
    
    $ chmod +x install.sh
    $ ./install.sh

# Running Steem

Go to Steem's installation directory  (Example: `steem_testnet/steem`) and `cd` to where the daemon `steemd` was built.

    $ cd steem_testnet/steem/build/programs/steemd/

Run `steemd` with the following arguments
    
    $ ./steemd -d testnet

Quit out from the daemon. The initial run will generate a `testnet` directory and the `config.ini` under that directory. Upon running, a screen similar to the following will be printed on the screen:

    ------------------------------------------------------

                STARTING TEST NETWORK

    ------------------------------------------------------
    initminer public key: TST6LLegbAgLAy28EHrffBVuANFWcFgmqRMW13wBmTExqFE9SCkg4
    initminer private key: 5JNHfZYKGaomSFvd4NUdQ9qMcEAC43kujbfjueTHpVapX1Kzq2n
    chain id: 18dcf0a285365fc58b71f18b3d3fec954aa0c141c44e4e5cb4cf777b9eab274e
    blockchain version: 0.19.1
    ------------------------------------------------------

Place the initminer private key 
