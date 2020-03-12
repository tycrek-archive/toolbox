#!/bin/sh

read -s password
mcrcon -H 127.0.0.1 -P 25575 -p $password -t
