# docker-mariadb
Build a opensuse image which run mariadb.

#### VERSION
mariadb-10.0.21

#### USAGE
```
docker run --name [contianer_name] -e MYSQL_ROOT_PASSWORD=[root_password] -e MYSQL_USER=[db_user] -e MYSQL_PASSWORD=[db_user_password] -e MYSQL_DATABASE=[db_name] -P -d mengzyou/docker-mariadb:10.0  
```

It will create a database named [db_name] and a user [db_user] for it.
