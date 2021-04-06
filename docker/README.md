after use docker-compose to start the containers, 
docker exec calltrace-mariadb bash  
  mysql -u root -p "call_trace" < /root/admin.sql
