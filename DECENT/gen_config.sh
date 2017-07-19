#!/bin/bash

# Generate a new account and transfer over to account_keys.txt
./keys_generator > account_keys.txt

# Extract the keys respectively to their own variables
PUB_KEY=`grep -oP "Public key:\s+\K\w+" account_keys.txt`
PRIV_KEY=`grep -oP "Private key:\s+\K\w+" account_keys.txt`
echo "Keys extracted"

dirName=gen
# Check if directory exists
if [ ! -d "$dirName" ]; then
    mkdir -p "$dirName"
fi

cp config.ini_template $dirName/config.ini

sed -i -e "s/pubkey/$PUB_KEY/g" "$dirName/config.ini"
sed -i -e "s/privkey/$PRIV_KEY/g" "$dirName/config.ini"

echo "New config.ini file created in gen/config.ini"
echo "Done"
