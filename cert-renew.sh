#!/bin/bash

## Script to obtain Let's Encrypt wildcard certificates (interactive)

# Check if root (http://stackoverflow.com/questions/18215973/ddg#18216122)
if [ "$EUID" -ne 0 ]
then
	echo "Script must be run as root!"
	exit 1
fi

# List of domains we want a certificate for
# For multi-level subdomains, dual wildcards (*.*.example.com) are
# not permitted. Instead we need *.sub.example.com
declare -a domains=('jmoore.dev' '*.jmoore.dev')

# Iterate through domains to build a string for letsencrypt command
str=''
for i in "${domains[@]}"
do
	str="$str -d $i"
done

# Run letsencrypt interactively to obtain a certificate
letsencrypt certonly --manual --preferred-challenges dns $str
