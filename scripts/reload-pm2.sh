#!/bin/bash

sudo cd /var/www/sites-available/due-diligence
sudo mkdir dist
sudo cd client/due-diligence-web

#install node js
sudo dnf module install nodejs:12

sudo npm install -g yarn

sudo cd /var/www/sites-available/due-diligence/client

sudo yarn install
CI=true sudo yarn build

sudo cd /var/www/sites-available/due-diligence/

sudo cp -r client/due-diligence-web/build dist

sudo cd /var/www/sites-available/due-diligence/server
sudo yarn install

sudo cd /var/www/sites-available/due-diligence

sudo pm2 startOrReload server/ecosystem.config.js
