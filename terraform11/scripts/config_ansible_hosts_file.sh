#!/bin/bash

TEXT=$(cat install-ansible-template.sh)
echo "$TEXT" > input.txt

IP_ADDR_ONE=$1
IP_ADDR_TWO=$2

# get IP addresses of the ansible nodes
IP_ADDRESS_ARRAY=( "$IP_ADDR_ONE" "$IP_ADDR_TWO" )

# get IP addresses from array and format as a newline separated string of ip addresses
## 1.1.1.1
## 2.2.2.2
for i in "${IP_ADDRESS_ARRAY[@]}"; do
    IP_ADDRESSES_TEXT="$i\n$IP_ADDRESSES_TEXT"
    echo $i
done

# remove last line (empty line)
#IP_ADDRESSES_TEXT=$(echo "$IP_ADDRESSES_TEXT" | sed '$d')
echo "$IP_ADDRESSES_TEXT" | awk '{gsub(/\\n/,"\n")}1' | sed '$d' > add.txt

# write to file
#IP_ADDRESSES_TEXT=`echo $IP_ADDRESSES_TEXT | tr '\n' "\\n"`
echo "IP:"
echo "$IP_ADDRESSES_TEXT"
echo "$TEXT" | sed "/\[webservers\]/r add.txt" input.txt > install-ansible.sh

chmod +x install-ansible.sh
