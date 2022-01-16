#!/bin/bash
cd /var/www/sites-available/due-diligence
mkdir dist
cp -r client/due-diligence-web/build dist
cd /var/www/sites-available/due-diligence/server
npm install
pm2 startOrReload ecosystem.config.js
