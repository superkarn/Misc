# Create the log folder if not exist
$log_path = "R:\temp\logs\backup\"

if (!(test-path $log_path))
{
    New-Item -ItemType Directory -Force -Path $log_path 
}

# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the document folder to OneDrive
$log = "$log_path$today_string-Document-backup-OneDrive.txt"
robocopy "D:\Storage\Dropbox\Documents\" "D:\Storage\OneDrive\Documents\" /mir /log:$log

Write-Output "Backup completed.  See the log here: $log"