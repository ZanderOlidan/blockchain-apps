#!/bin/bash

./keys_generator > account_keys.txt
export PUB_KEY=`grep -oP "Public key:\s+\K\w+" account_keys.txt`
echo $PUB_KEY
export PRIV_KEY=`grep -oP "Private key:\s+\K\w+" account_keys.txt`
echo $PRIV_KEY

