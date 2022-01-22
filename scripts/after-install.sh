#!/bin/bash

#install node js
curl -sL https://rpm.nodesource.com/setup_16.x |  -E bash -

yum install -y nodejs

npm install -g yarn

export PATH="/usr/bin/node:$PATH"

cd /var/www/sites-available/due-diligence

exec >>/var/log/after-install.log 2>&1

cp -r client/due-diligence-web/build .

cd server

npm install --force

node app.js &

exit 0;
