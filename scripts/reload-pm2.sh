#!/bin/bash

DIR="$( cd "$( dirname "$0" )" && pwd )"

#install node js
curl -sL https://rpm.nodesource.com/setup_16.x |  -E bash -

yum install -y nodejs

export PATH="/usr/bin/node:$PATH"

cd $DIR/client/due-diligence-web

npm install -g yarn

/usr/local/bin/yarn install

CI=true /usr/local/bin/yarn build

cp -r $DIR/client/due-diligence-web/build .

cd $DIR/server

npm install --force

node app.js
