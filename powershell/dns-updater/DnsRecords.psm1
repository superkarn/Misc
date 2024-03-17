# https://superuser.com/a/803885
function Get-PublicIp {
	(Invoke-WebRequest "https://ifconfig.me/ip").Content.Trim()
}

# https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-list-dns-records
function Get-DnsRecords-TypeA {
	Param (
		[Parameter(Mandatory=$true)]
		[string] $ApiToken,
		
		[Parameter(Mandatory=$true)]
		[string] $ZoneId, 
		
		[Parameter(Mandatory=$false)]
		[string] $CurlPath = "C:\Windows\System32"
	)
	
	$result = & "$CurlPath\curl" `
		-s `
		-X GET "https://api.cloudflare.com/client/v4/zones/$ZoneId/dns_records?type=A" `
		--header "Content-Type:application/json" `
		--header "Authorization: Bearer $ApiToken" 
		
	$result_json = $result | ConvertFrom-Json
	
	if ($result_json.success -ne $true) {
		return "Error: $($result_json.errors[0].message)"
	}
	
	return $result_json.result
}

function Get-DnsRecord {
	Param (
		[Parameter(Mandatory=$true)]
		[string] $ApiToken,
		
		[Parameter(Mandatory=$true)]
		[string] $ZoneId, 
		
		[Parameter(Mandatory=$true)]
		[string] $DnsRecordId, 
		
		[Parameter(Mandatory=$false)]
		[string] $CurlPath = "C:\Windows\System32"
	)
	
	$result = & "$CurlPath\curl" `
		-s `
		-X GET "https://api.cloudflare.com/client/v4/zones/$ZoneId/dns_records/$DnsRecordId" `
		--header "Content-Type:application/json" `
		--header "Authorization: Bearer $ApiToken"
		
	$result_json = $result | ConvertFrom-Json
	
	if ($result_json.success -ne $true) {
		return "Error: $($result_json.errors[0].message)"
	}
	
	return $result_json.result
}

# https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-patch-dns-record
function Update-DnsRecord-TypeA {
	Param (
		[Parameter(Mandatory=$true)]
		[string] $ApiToken,
		
		[Parameter(Mandatory=$true)]
		[string] $ZoneId, 
		
		[Parameter(Mandatory=$true)]
		[string] $DnsRecordId, 
		
		[Parameter(Mandatory=$true)]
		[string] $DnsName, 
		
		[Parameter(Mandatory=$true)]
		[string] $DnsIp, 		
		
		[Parameter(Mandatory=$false)]
		[string] $CurlPath = "C:\Windows\System32"
	)
	
	$result = & "$CurlPath\curl" `
		-s `
		-X PATCH "https://api.cloudflare.com/client/v4/zones/$ZoneId/dns_records/$DnsRecordId" `
		--header "Content-Type:application/json" `
		--header "Authorization: Bearer $ApiToken" `
		--data "{\`"type\`":\`"A\`",\`"name\`":\`"$DnsName\`",\`"content\`":\`"$DnsIp\`"}"
	
	$result_json = $result | ConvertFrom-Json
	
	if ($result_json.success -ne $true) {
		return "Error: $($result_json.errors[0].message)"
	}
	
	return "$DnsName has been updated to $DnsIp"
}