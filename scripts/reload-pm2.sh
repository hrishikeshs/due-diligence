#!/bin/bash
cd /var/www/sites-available/due-diligence
mkdir dist
cd client/due-diligence-web
CI=true yarn build
cp -r client/due-diligence-web/build dist
cd /var/www/sites-available/due-diligence/server
npm install
pm2 startOrReload ecosystem.config.js
