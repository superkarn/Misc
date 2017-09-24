# MariaDB Docker image
# https://hub.docker.com/_/mariadb/
#
# How to start a new container
#  - save database data to host folder
#  - use conf file from host

docker run `
--name [my-container-name] `
-v //d/Docker/volumes/[my-container-name]:/var/lib/mysql `
-v //d/Docker/volumes/[my-container-name]/conf:/etc/mysql/conf.d `
-e MYSQL_ROOT_PASSWORD=[my-root-password] `
-d mariadb
