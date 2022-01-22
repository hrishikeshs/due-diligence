#!/bin/bash

cd client/due-diligence-web

/usr/local/bin/yarn install

CI=true /usr/local/bin/yarn build

cd ../../

cp -r client/due-diligence-web/build .

cd server

npm install --force

node app.js &
