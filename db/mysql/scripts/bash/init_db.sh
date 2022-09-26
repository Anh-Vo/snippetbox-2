#!/bin/bash

mysql -u $SQL_USER -p $SQL_USER_PASSWORD create $MYSQL_DATABASE
cat /tmp/*.sql | mysql -u $SQL_USER -p $SQL_USER_PASSWORD