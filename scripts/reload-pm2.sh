#!/bin/bash

sudo cd /var/www/sites-available/due-diligence/client/due-diligence-web

#install node js
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -

sudo yum install -y nodejs

export PATH="/usr/bin/node:$PATH"

sudo npm install -g yarn

sudo /usr/local/bin/yarn install

CI=true sudo /usr/local/bin/yarn build

sudo cd /var/www/sites-available/due-diligence/

sudo cp -r client/due-diligence-web/build .

sudo cd /var/www/sites-available/due-diligence/server

sudo npm install --force

sudo node app.js
