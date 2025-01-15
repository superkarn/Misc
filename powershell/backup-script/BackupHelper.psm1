
function RoboCopy-From {
	Param (
		[Parameter(Mandatory=$true)]
		[string] $SourcePath,
        
		[Parameter(Mandatory=$true)]
		[string] $DestinationPath,
		
		[Parameter(Mandatory=$true)]
		[string] $BackupType
	)
    
    $today = get-date
    $todayString = $today.ToString("yyyy-MM-dd")
    $logFilename = "$($DestinationPath)\$($todayString)-$($BackupType)-backup.txt"
    
	
    echo "robocopy $($SourcePath) $($DestinationPath)\$($BackupType)\ /mir /log:$($logFilename)"
    robocopy "$($SourcePath)" "$($DestinationPath)\$($BackupType)\" /mir /log:$($logFilename)
	
	# To copy only jpegs files, run this:
    #robocopy "$($SourcePath)" "$($DestinationPath)\$($BackupType)\" *.jpg /mir /log:$($logFilename)
}
