How to set up Git on Windows

# 1 Install git
```
> choco install tortoisegit
```


# 2 Set pageant to run on start up
See [here](https://tunecomp.net/add-program-to-startup-windows-10/)

1. Find pageant executable (should be `C:\Program Files\TortoiseGit\bin\pageant.exe`)
1. Press `Win` + `R` to bring up the Run prompt
1. Type `shell:startup`, which opens a folder at `C:\Users\{username}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
1. Copy and paste the short cut to pageant into this folder.


# 3 Set GIT_SSH with plink
See [here](https://stackoverflow.com/a/43313491/1398750)

1. Find

1. Right click "This PC"
1. Select "Properties"
1. Click "Advanced system settings"
1. Click "Environment Variables"
1. Under "System variables", click "New..."
1. Enter 
    1. Variable name: `GIT_SSH`
    1. Variable value: `{path-to-plink}` (should be `C:\Program Files\TortoiseGit\bin\TortoisePlink.exe`)

# 4 Add key to pageant
You need to readd keys to pageant on every system restart.

1. Open pageant by double clicking the icon from System Tray
1. Click "Add Key"
1. Select .ppk file
1. Enter the password
