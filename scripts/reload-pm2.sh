#!/bin/bash
cd /var/www/sites-available/due-diligence
mkdir dist
cd client/due-diligence-web
npm install -g yarn
CI=true yarn build
cd /var/www/sites-available/due-diligence/
cp -r client/due-diligence-web/build dist
cd /var/www/sites-available/due-diligence/server
npm install
pm2 startOrReload ecosystem.config.js
