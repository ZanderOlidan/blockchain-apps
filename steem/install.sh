#!/bin/bash

mkdir steem_testnet
cd steem_testnet
# Required packages
echo "Installing required packages"
sudo apt-get install -y \
    autoconf \
    automake \
    cmake \
    g++ \
    git \
    libssl-dev \
    libtool \
    make \
    pkg-config \
    python3 \
    python3-jinja2

# Boost packages (also required)
echo "Installing Boost 1.62"

export BOOST_ROOT=$HOME/opt/boost_1_60_0
sudo apt-get update
sudo apt-get install autotools-dev build-essential g++ libbz2-dev libicu-dev python-dev
wget -c 'http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.bz2/download' \
         -O boost_1_60_0.tar.bz2
tar xjf boost_1_60_0.tar.bz2
cd boost_1_60_0/
./bootstrap.sh "--prefix=$BOOST_ROOT"
./b2 install

sudo apt-get install -y \
    libboost-chrono-dev \
    libboost-context-dev \
    libboost-coroutine-dev \
    libboost-date-time-dev \
    libboost-filesystem-dev \
    libboost-iostreams-dev \
    libboost-locale-dev \
    libboost-program-options-dev \
    libboost-serialization-dev \
    libboost-signals-dev \
    libboost-system-dev \
    libboost-test-dev \
    libboost-thread-dev

# Optional packages (not required, but will make a nicer experience)
sudo apt-get install -y \
    doxygen \
    libncurses5-dev \
    libreadline-dev \
    perl

echo "Installing Steem"
cd ..

git clone https://github.com/steemit/steem
cd steem
git submodule update --init --recursive
mkdir build
cd build
cmake -DBOOST_ROOT="$BOOST_ROOT" -DCMAKE_BUILD_TYPE=Release -DBUILD_STEEM_TESTNET=ON ..
make

echo "Install finished"
#make -j$(nproc) steemd
#make -j$(nproc) cli_wallet
# optional
#make install  # defaults to /usr/local
