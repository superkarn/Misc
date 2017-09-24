# redis image
# https://hub.docker.com/_/redis/
#
# - Start a new container
# - Save data to host folder
# - Use conf file from host
#
# Note: folder path needs some translation:
# D:\my\path -> //d/my/path

docker run `
--name redis-01 `
-p 6379:6379 `
-v //d/Docker/volumes/[my-container-name]:/data `
-v //d/Docker/volumes/[my-container-name]/conf:/usr/local/etc/redis `
-d redis