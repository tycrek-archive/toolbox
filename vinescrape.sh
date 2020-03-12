#!/bin/sh

cd ../programs/node-vinescrape/
screen -S vinescrape -d -m bash -c "node app.js"
