#!/bin/bash

password=$1

sqlite3 /var/lib/grafana/grafana.db "update user set password = '59acf18b94d7eb0694c61e60ce44c110c7a683ac6a8f09580d626f90f4a242000746579358d77dd9e570e83fa24faa88a8a6', salt = 'F3FAxVm33R' where login = 'admin';"

curl -X PUT -H "Content-Type: application/json" -d '{
  "oldPassword": "admin",
  "newPassword": "'$password'",
  "confirmNew": "'$password'"
}' http://admin:admin@localhost:3000/api/user/password
