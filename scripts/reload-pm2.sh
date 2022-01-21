#!/bin/bash

#install node js
curl -sL https://rpm.nodesource.com/setup_16.x |  -E bash -

yum install -y nodejs

npm install -g yarn

export PATH="/usr/bin/node:$PATH"

cd /var/www/sites-available/due-diligence

sudo chmod +x ./scripts/after-install.sh

sudo source ./scripts/after-install.sh

exit 0;
