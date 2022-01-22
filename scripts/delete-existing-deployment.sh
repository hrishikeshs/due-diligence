#!/bin/bash

exec >/var/log/after-install.log 2>&1

PID=`netstat -ntulp  | grep node | awk '{print $7}'| tr '/' ' ' | awk '{print $1}'`

echo "Stopping existing server...\n"
kill -9 $PID
echo "Server stopped...\n"
cd /var/www/sites-available
rm -rf due-diligence
mkdir due-diligence
