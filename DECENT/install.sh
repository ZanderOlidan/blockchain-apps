#!/bin/bash

echo "Installing prerequisites..."
chmod +x prereq.sh
prereq.sh

echo "Installing Boost..."
BOOST_ROOT="~/opt/boost_1_60_0"

if [ ! -d "$BOOST_ROOT" ]; then
    chmod +x boost_install.sh 
    boost_install.sh
fi

echo "Generating keys..."
chmod +x gen_config.sh
gen_config.sh

echo "Generating genesis..."
chmod +x gen_genesis.sh
gen_genesis.sh


