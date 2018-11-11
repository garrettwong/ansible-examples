#!/bin/sh

TEXT=$(cat ../install-ansible-template.sh)
echo "$TEXT" > input.txt

# get IP addresses of the ansible nodes
IP_ADDRESS_ARRAY=( "1.1.1.1" "2.2.2.2" )

# get IP addresses from array and format as a newline separated string of ip addresses
## 1.1.1.1
## 2.2.2.2
for i in "${IP_ADDRESS_ARRAY[@]}"; do
    IP_ADDRESSES_TEXT="$i\n$IP_ADDRESSES_TEXT"
done

# remove last line (empty line)
IP_ADDRESSES_TEXT=$(echo "$IP_ADDRESSES_TEXT" | sed '$d')
echo "$IP_ADDRESSES_TEXT" > add.txt

# write to file
IP_ADDRESSES_TEXT=`echo $IP_ADDRESSES_TEXT | tr ' ' "\\n"`
echo "$IP_ADDRESSES_TEXT"
echo "$TEXT" | sed "/\[webservers\]/r add.txt" input.txt > ../install-ansible.sh