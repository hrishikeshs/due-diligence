#!/bin/bash
cd /var/www/sites-available/due-diligence
mkdir dist
cd client/due-diligence-web

#install node js
curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
bash n lts

# Install the correct version of node.
n 12.12.0

# Now node and npm are available
npm install -g n
npm install -g yarn
yarn install
CI=true yarn build
cd /var/www/sites-available/due-diligence/
cp -r client/due-diligence-web/build dist
cd /var/www/sites-available/due-diligence/server
npm install
pm2 startOrReload ecosystem.config.js
