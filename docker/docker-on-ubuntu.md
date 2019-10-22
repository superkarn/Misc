# Setting up Docker on Ubuntu Server

1. Install Docker [link](https://docs.docker.com/install/linux/docker-ce/ubuntu/#upgrade-docker-ce)
1. Install Docker Compose [link](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
1. Add ubuntu server user to docker group.  [link](https://stackoverflow.com/a/33782459/1398750)
1. Get [portainer-compose](https://github.com/portainer/portainer-compose) (This use the web gui for managing docker.)
   1. Clone the repository
    ```
    > git clone https://github.com/portainer/portainer-compose.git
    ```
   2. Rename the folder from `portainer-compose` to `portainer`
    ```
    mv portainer-compose portainer
    ```
   3. Go into the nginx folder
    ```
    > cd portainer/nginxproxy_portainer/
    ```
   4. Update the virtual host
    ```
    portainer:
      environment:
        - VIRTUAL_HOST=docker-server #replace with your host name
    ```
   5. Run Docker Compose to start it
    ```
    > docker-compose up -d
    ```
   6. Open portainer in the browser via http://docker-server (or whatever your host name you use)
1. Get the [development](/docker/development/docker-compose.yml) docker file
    1. Copy the file into a development folder
    1. Run Docker Compose to start it
    ```
    > cd ~/development
    > docker-compose up -d
    ```
