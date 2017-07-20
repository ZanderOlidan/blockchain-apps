#!/bin/bash

# All the scripts are taken inside the scripts folder
# This install.sh is merely the main function to execute them
# Comment out unwanted scripts if reinstalling (i.e Boost)

scriptsDir="scripts"

# Prerequisites
echo "Installing prerequisites..."
chmod +x $scriptsDir/prereq.sh
./$scriptsDir/prereq.sh

# Boost Library
echo "Installing Boost..."
BOOST_ROOT="~/opt/boost_1_60_0"

if [ ! -d "$BOOST_ROOT" ]; then
    chmod +x $scriptsDir/boost_install.sh 
    ./$scriptsDir/boost_install.sh
fi

# For generatking keys and config
echo "Generating config file..."
chmod +x $scriptsDir/gen_config.sh
./$scriptsDir/gen_config.sh

# For generating the genesis file. 
echo "Generating genesis..."
chmod +x $scriptsDir/gen_genesis.sh
./$scriptsDir/gen_genesis.sh


#1. Get decent 
#2. Make with genesis embedded https://github.com/DECENTfoundation/DECENT-Network/wiki/private-testnet#embedding-genesis-optional
#3. Create files with datafile and config copied
