#!/bin/bash

cd $(dirname $0)

#install node js
curl -sL https://rpm.nodesource.com/setup_16.x |  -E bash -

yum install -y nodejs

npm install -g yarn

export PATH="/usr/bin/node:$PATH"

cd client/due-diligence-web

/usr/local/bin/yarn install

CI=true /usr/local/bin/yarn build

cd ../../

cp -r client/due-diligence-web/build .

cd server

npm install --force

node app.js
