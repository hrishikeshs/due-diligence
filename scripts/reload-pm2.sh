#!/bin/bash

sudo cd /var/www/sites-available/due-diligence

#install node js
sudo dnf module install nodejs:12

sudo npm install -g yarn

sudo cd /var/www/sites-available/due-diligence/client/due-diligence-web/

sudo /usr/local/bin/yarn install

CI=true sudo /usr/local/bin/yarn build

sudo cd /var/www/sites-available/due-diligence/

sudo mkdir dist

sudo cp -r client/due-diligence-web/build dist

sudo cd /var/www/sites-available/due-diligence/server

sudo npm install

sudo node app.js
