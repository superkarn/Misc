# MariaDB Docker image
# https://hub.docker.com/_/mariadb/
#
# - Start a new container
# - Save data to host folder
# - Use conf file from host
#
# Note: folder path needs some translation:
# D:\my\path -> //d/my/path

docker run `
--name [my-container-name] `
-p 3306:3306
-v [absolute-path-on-host]/data:/var/lib/mysql `
-v [absolute-path-on-host]/conf:/etc/mysql/conf.d `
-e MYSQL_ROOT_PASSWORD=[my-root-password] `
-d mariadb
