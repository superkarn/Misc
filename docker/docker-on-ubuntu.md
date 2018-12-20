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
   3. Go into the folder and run Docker Compose to start it
    ```
    > cd portainer
    > docker-compose up -d
    ```
