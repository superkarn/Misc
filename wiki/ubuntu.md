# Files
## How to creat a fileshare
See [here](https://www.howtogeek.com/176471/how-to-share-files-between-windows-and-linux/).

1. Install Samba
```
sudo apt-get install samba
```

2. Configuare username and password
```
smbpasswd -a myUsername
# Then type in a password
```

3. Edit the smb.conf file to specify which folder you want to share
```
sudo vim /etc/samba/smb.conf
```

4. Scroll down to the end of the file and add the configurations for your new shared folder
```
[projects]
   path = /path/to/my/shared/folder
   available = yes
   valid users = myUsername
   read only = no
   browsable = yes
   public = yes
   writable = yes

```

5. Restart Samba
```
sudo service smbd restart
```
