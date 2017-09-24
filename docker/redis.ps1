# redis image
# https://hub.docker.com/_/redis/
#
# - Start a new container
# - Expose default port
# - Save data to host folder
# - Use conf file from host
#
# Note: folder path needs some translation:
# D:\my\path -> //d/my/path

docker run `
--name redis-01 `
-p 6379:6379 `
-v [absolute-path-on-host]/data:/data `
-v [absolute-path-on-host]/conf:/usr/local/etc/redis `
-d redis
