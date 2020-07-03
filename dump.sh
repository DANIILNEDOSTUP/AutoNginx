#!/bin/bash

echo "Name of you DB"
read db_name

echo "Name of user"
read db_user

echo "Passwd of DB"
read db_pass

sudo touch dump.sql
sudo chmod 777 dump.sql
sudo mysqldump -u $db_user -p$db_pass $db_name > dump.sql
echo "SUGAR!"
