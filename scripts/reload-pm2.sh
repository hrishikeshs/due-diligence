#!/usr/bin/bash

cd /var/www/sites-available/due-diligence
mkdir dist
cd client/due-diligence-web

#install node js
sudo curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n
sudo /usr/bin/bash n lts

npm install -g n

# make cache folder (if missing) and take ownership
sudo mkdir -p /usr/local/n
sudo chown -R $(whoami) /usr/local/n

# make sure the required folders exist (safe to execute even if they already exist)
sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

# take ownership of Node.js install destination folders
sudo chown -R $(whoami) /usr/local/bin /usr/local/lib /usr/local/include /usr/local/share

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
