#!/bin/bash

/usr/bin/mysqld_safe --skip-grant-tables &

sleep 5

mysql -u root -e "CREATE DATABASE call_trace"
mysql -u root "call_trace" < /root/admin.sql
