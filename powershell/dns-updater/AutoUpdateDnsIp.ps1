Import-Module "./DnsRecords"

# Some hard coded values
$LogPath = "./"
$ApiToken = ""
$ZoneId = ""

# These are the DNS Records we want to auto update
$DnsRecordIds = @{
    root = "";
    star = "";
}



# Get current public IP
$CurrentIp = Get-PublicIp
Add-Content -Path "$LogPath/log.txt" -Value "$((Get-Date).Date.ToString("yyyy-MM-dd")) -> $CurrentIp"

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
