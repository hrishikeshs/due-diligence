#!/usr/bin/bash

cd /var/www/sites-available/due-diligence
mkdir dist
cd client/due-diligence-web

#install node js
sudo curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo /usr/bin/bash n lts
sudo npm install -g n
# Install the correct version of node.
sudo n 12.12.0
sudo npm install -g yarn
sudo yarn install
CI=true sudo yarn build
cd /var/www/sites-available/due-diligence/
cp -r client/due-diligence-web/build dist
cd /var/www/sites-available/due-diligence/server
sudo npm install
pm2 startOrReload ecosystem.config.js
