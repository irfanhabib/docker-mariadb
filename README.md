# docker-mariadb
Build mariadb images based on opensue image.

## Tags and `Dockerfile` links
- [`5.5` (5.5/dockerfile)](https://github.com/mengzyou/docker-mariadb/blob/master/5.5/Dockerfile)  
- [`10.0` (10.0/dockerfile)](https://github.com/mengzyou/docker-mariadb/blob/master/10.0/Dockerfile)  
- [`10.1` (10.1/dockerfile)](https://github.com/mengzyou/docker-mariadb/blob/master/10.1/Dockerfile) 

##How to use
### 5.5
```
docker run --name [contianer_name] -e MYSQL_ROOT_PASSWORD=[root_password] -e MYSQL_USER=[db_user] -e MYSQL_PASSWORD=[db_user_password] -e MYSQL_DATABASE=[db_name] -P -d mengzyou/docker-mariadb:5.5  
```  

###10.0
```
docker run --name [contianer_name] -e MYSQL_ROOT_PASSWORD=[root_password] -e MYSQL_USER=[db_user] -e MYSQL_PASSWORD=[db_user_password] -e MYSQL_DATABASE=[db_name] -P -d mengzyou/docker-mariadb:10.0
```  

###10.1
```
docker run --name [contianer_name] -e MYSQL_ROOT_PASSWORD=[root_password] -e MYSQL_USER=[db_user] -e MYSQL_PASSWORD=[db_user_password] -e MYSQL_DATABASE=[db_name] -P -d mengzyou/docker-mariadb:10.1
```  
