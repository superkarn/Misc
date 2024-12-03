
# Write content to a file, overwriting it each time
function Write-Cache {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Key,

        [Parameter(Mandatory=$true)]
        [string]$Value,

        [Parameter(Mandatory=$false)]
        [string]$CacheFolderPath="./cache"
    )
    
    # Create a new file whether it exists or not
    New-Item -Path "./$CacheFolderPath/$Key" -ItemType "file" -Value "$Value" -Force
}

# Function to read a string from a file; if key doesn't exist, return null instead of exception
function Read-Cache {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Key,

        [Parameter(Mandatory=$false)]
        [string]$CacheFolderPath="./cache"
    )
    
    try {
        Return Get-Content -Path "$CacheFolderPath/$Key" -ErrorAction Stop
    } catch {
        Return $null
    }
}
