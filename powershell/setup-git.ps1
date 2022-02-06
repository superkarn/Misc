## Prerequisites
# The follow should already be installed
# - Git
# - TortoiseGit
#   - pageant
#   - TortoisePlink



# Set up GIT_SSH variable
Write-Host "Creating Environment Variable GIT_SSH" -ForegroundColor Green
[Environment]::SetEnvironmentVariable("GIT_SSH", "C:\Program Files\TortoiseGit\bin\TortoisePlink.exe", "Machine")

# Add Pageant to StartUp
if(!(Test-Path -Path "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\pageant.lnk"))
{
    Write-Host "Setting pageant.exe to run on start up" -ForegroundColor Green
    New-Item `
        -ItemType SymbolicLink `
        -Path "$Env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" `
        -Name "pageant.lnk" `
        -Value "C:\Program Files\TortoiseGit\bin\pageant.exe"
}
