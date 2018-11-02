# Setting up and running ASP.NET applications using Docker and Windows containers

## 0 Install portainer
- Follow the instructions [here](https://portainer.io/install.html)
```
> docker volume create portainer_data
> docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
```

## 1 Installation and Set Up
- Download and install [Docker For Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
- Right click Docker icon in the System Tray and select "Kitematic" and follow the instruction to install it
- Right click Docker icon in the System Tray and select "Switch to Windows containers..." and follow the instruction

## 2 Docker Images
Download these images: [microsoft/aspnet](https://hub.docker.com/r/microsoft/aspnet/), [microsoft/mssql-server-windows-developer](https://hub.docker.com/r/microsoft/mssql-server-windows-developer/), ...
```PowerShell
PS> docker pull microsoft/aspnet
PS> docker pull microsoft/mssql-server-windows-developer
```


## 3 docker-compose.yml
- Create a new folder.  This will be the prefix for your containers' names.
- Create a new docker-compose.yml with the content below.
- Replace `D:\Projects\test` with the path to your ASP.NET application.
```yml
version: '3.2'
services:
    web-app:
        image: "microsoft/aspnet"
        volumes:
            - D:\Projects\test:C:\inetpub\wwwroot
```

## 4 Start containers
Run docker-compose inside your folder above.
```PowerShell
PS> docker-compose -d up
```

## 5 Get container names
You can find your new container's name via Kitematic or by running the following command.
```PowerShell
PS> docker container ls
```
    
## 6 Get container IPs
Run the following command.  The container's IP is the value of `IPv4 Address`.
```PowerShell
PS> docker exec -it [container-name] ipconfig
```

## 7 Load the application
- On the host, open a browser and go to http://[container-ip]/

## 8 Inside the container
If you want to see into a container, run the following command to access PowerShell.
```PowerShell
PS> docker exec -it [container-name] powershell
```
