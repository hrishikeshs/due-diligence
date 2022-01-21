#!/bin/bash

sudo cd /var/www/sites-available/due-diligence/client/due-diligence-web

#install node js
sudo dnf module install nodejs:15

sudo npm install -g yarn

sudo /usr/local/bin/yarn install

CI=true sudo /usr/local/bin/yarn build

sudo cd /var/www/sites-available/due-diligence/

sudo cp -r client/due-diligence-web/build .

sudo cd /var/www/sites-available/due-diligence/server

sudo npm install

sudo node app.js
