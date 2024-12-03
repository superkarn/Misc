Import-Module "./DnsRecords"
Import-Module "./SimpleCache"

# Some hard coded values
$LogPath = "./"
$ApiToken = ""
$ZoneId = ""

# These are the DNS Records we want to auto update
$DnsRecordIds = @{
    root = "";
    star = "";
}

####################
# This section is for easy of log reading
# Log a dot (.) each time this script is run
Add-Content -Path "$LogPath/log.txt" -Value "." -NoNewline

$TodayDate = $(Get-Date -Format "yyyy-MM-dd")
$CachedDate = Read-Cache "cached-date"

if ($TodayDate -ne $CachedDate) {
	Write-cache "cached-date" $TodayDate
	Add-Content -Path "$LogPath/log.txt" -Value ""
	Add-Content -Path "$LogPath/log.txt" -Value "$TodayDate " -NoNewline
}

####################


# Get current public IP
$CurrentIp = Get-PublicIp

# Get cached IP
$CachedIp = Read-Cache "cached-ip"

# If the current IP is NOT the same as cached IP,
# Update the DNS records, then update cache
if ($CurrentIp -ne $CachedIp) {
	Add-Content -Path "$LogPath/log.txt" -Value ""
	Add-Content -Path "$LogPath/log.txt" -Value "$(Get-Date -Format "yyyy-MM-dd HH:mm:ss") -> $CurrentIp"

    # Get current A records
    $CurrentDnsRecords_TypeA = Get-DnsRecords-TypeA $ApiToken $ZoneId

    # For each DNS record, check the IP
    foreach ($k in $DnsRecordIds.Keys) {
        $_dns = $CurrentDnsRecords_TypeA | Where-Object id -eq $DnsRecordIds[$k]
        
        # Update if the DNS's IP is outdated.
        if ($_dns.content -ne $CurrentIp) {
            $tmp = Update-DnsRecord-TypeA $ApiToken $ZoneId $_dns.id $_dns.name $CurrentIp
            Add-Content -Path "$LogPath/log.txt" -Value "    $($_dns.name) was updated from $($_dns.content)"
        }
    }
    

    # Also update the cache
    Write-Cache "cached-ip" $CurrentIp
    Add-Content -Path "$LogPath/log.txt" -Value "    Cached IP has been updated." -NoNewline
}
