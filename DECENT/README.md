# DECENT Network Build Steps

Majority of instructions taken from [DECENTNetwork's GitHub](https://github.com/DECENTfoundation/DECENT-Network)


**** WIP ****

Run `install.sh` and it should run all the commands and build. Note that this may take some time. (~30 mins to 1 hour).

**** WIP ****

# Building for DECENT Private chain

## Installation Prerequisites

### For quick installation

** WIP **
Run `prereq.sh` to install prerequisites and set environment variables.

    ./prereq.sh

** WIP **

### Building prerequisites manually

Using Ubuntu 16.04 LTS

    $ sudo apt-get update
    $ sudo apt-get install build-essential autotools-dev automake autoconf libtool make cmake checkinstall realpath gcc g++ clang flex bison doxygen gettext git qt5-default libqt5svg5-dev libreadline-dev libcrypto++-dev libgmp-dev libdb-dev libdb++-dev libssl-dev libncurses5-dev libboost-all-dev libcurl4-openssl-dev python-dev libicu-dev libbz2-dev

Set \$CC, \$CXX and add \$CMAKE_ROOT to PATH variable. Check versions of gcc and g++ depending on the OS's version respectively. (using `which` command. Example: `which gcc`)

    $ export CC=gcc-5
    $ export GXX=g++-5

The version of CMAKE in DECENT Network instruction is higher than installed CMAKE version on Ubuntu 16.04. This _may not_ have any effect, but installing it nonetheless. `cmake version 3.5.1` to `cmake version 3.7.2`

    # Download and build CMake 3.7.2
    $ mkdir -p ~/dev/DECENTfoundation/DECENT-Network-third-party
    $ cd ~/dev/DECENTfoundation/DECENT-Network-third-party
    $ rm -rf cmake-3.7.2*
    $ wget https://cmake.org/files/v3.7/cmake-3.7.2.tar.gz
    $ tar xvf cmake-3.7.2.tar.gz
    $ mkdir cmake-3.7.2_prefix
    $ cd cmake-3.7.2
    $ CMAKE_ROOT=$(realpath ../cmake-3.7.2_prefix)
    $ ./configure --prefix=$CMAKE_ROOT
    $ make
    $ make install
    $ cd ..
    $ rm -rf cmake-3.7.2 cmake-3.7.2.tar.gz
    $ export PATH=$CMAKE_ROOT/bin:$PATH

Boost installation. The boost version that comes with Ubuntu 16.04 is not supported (1.55.0). Decent required 1.60.0

    # Download and build Boost 1.60.0
    $ mkdir -p ~/dev/DECENTfoundation/DECENT-Network-third-party
    $ cd ~/dev/DECENTfoundation/DECENT-Network-third-party
    $ rm -rf boost_1_60_0* boost-1.60.0*
    $ wget https://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz
    $ tar xvf boost_1_60_0.tar.gz
    $ mkdir boost-1.60.0_prefix
    $ cd boost_1_60_0
    $ export BOOST_ROOT=$(realpath ../boost-1.60.0_prefix)
    $ ./bootstrap.sh --prefix=$BOOST_ROOT
    $ ./b2 install
    $ cd ..
    $ rm -rf boost_1_60_0 boost_1_60_0.tar.gz

Building `Boost 1.60.0` may take some time to install.

Errors were encountered because of shell directory variables. Check current variables such as `$BOOST_ROOT`, `$CMAKE_ROOT`, `$CC`, `$CXX`.

## Source, Build and Install Decent

The prerequisites must be installed in order for these to work. Again, these instructions are directly taken from DECENT-Network repo with few changes regarding to private net.

    # Clone the repo.
    $ mkdir -p ~/dev/DECENTfoundation
    $ cd ~/dev/DECENTfoundation
    $ git clone git@github.com:DECENTfoundation/DECENT-Network.git
    $ cd DECENT-Network
    $ git submodule update --init --recursive

    # Build and install Decent.
    $ mkdir -p ~/dev/DECENTfoundation/DECENT-Network-build
    $ cd ~/dev/DECENTfoundation/DECENT-Network-build
    $ cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Debug -DGRAPHENE_EGENESIS_JSON="$(realpath ../DECENT-Network/genesis/genesis.json)"../DECENT-Network 
    $ cmake --build . --target all -- -j -l 3.0
    $ cmake --build . --target install

# Post Install DECENT

Start the DECENT daemon `decentd` to create a `.decent` folder in the home directory.

    $ cd ~/dev/DECENTfoundation/DECENT-Network-build/artifacts/prefix/bin/
    $ ./decentd

Now press `CTRL-C` to stop `decentd`. This generates `~/.decent` directory. It is now possible to edit the configuration file in `~/.decent/data/decent/config.ini`. Run DECENT Daemon again. (`cd` to the bin folder above and `./decentd`).

Open another terminal and start CLI-Wallet. Make sure `decentd` is running to use `cli_wallet`

    $ cd ~/dev/DECENTfoundation/DECENT-Network-build/artifacts/prefix/bin/
    $ ./cli_wallet

It's going to ask to set the password to initialize. Change `mypassword` into your personal password to set. Only type commands after the `>>>` prompt.
    
    new >>> set_password mypassword
    set_password mypassword
    null
    locked >>> unlock mypassword
    unlock mypassword
    null
    unlocked >>>

When running `cli_wallet` in the future, it will start off as `locked` and using `unlock mypassword` will unlock the commands for `cli_wallet`.

Exit out of the `cli_wallet` and the daemon. Run the following command to activate the decent daemon with additional commands.

    $ ~/dev/DECENTfoundation/DECENT-Network-build/artifacts/prefix/bin/decentd --rpc-endpoint 127.0.0.1:8090 --enable-stale-production -w '"1.4.0"' 

Open the wallet after.

# Getting an account

Register at [DecentGo](www.decentgo.com). Generate the private key from Security tab under Account. (Named as Recovery Phrase). **Note:** When dealing with anything that asks for the account name, use the Encrypted Alternate under your wallet.

## Running as GUI

Run the compiled program from wherever the network was built. (Example: ~/dev/DECENTfoundation/DECENT-Network-build) and `cd` to `DECENT-Network-build/artifacts/prefix/bin`. There should be 3 programs there: `decentd` - daemon for decent, `cli_wallet` - command line version of wallet, and `DECENT`, the GUI version. To run the GUI app, execute `./DECENT`

# TODO:

- Finish this documentation
    - Merge `testnetInstall.md` to this `README.md` file
- Create Shell Script file for easy install
    - Install SH
    - Prerequisite SH
    - Boost install check before Decent Install
    - Decent Private Chain setup (including dynamic generation of keys)
        - Key Gen output to file, then to Genesis file, config file

