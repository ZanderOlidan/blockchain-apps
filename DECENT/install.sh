#!/bin/bash

echo "Installing prerequisites"
prereq.sh

echo "Installing Boost"
BOOST_ROOT="~/opt/boost_1_60_0"

if [ ! -d "$BOOST_ROOT" ]; then
    boost_install.sh
fi

echo "Generating keys..."
gen_config.sh



