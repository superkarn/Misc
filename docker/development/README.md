Option 1
- develop on windows
- ftp to linux
- create docker image
	> docker build -t <app-name-all-lowercase> .
- start docker container
	> docker run -d -p 8080:80 --name <container-name> <image-name>
	
	
	
Option 2
- create docker image
- develop on windows
- ftp to linux


option 3
- Build and run with Kestrel with VS
- test the app
- build the app with docker (I use a multi-stage docker build meaning the app is actually built in a docker image so the build is the same everywhere)
- start the container