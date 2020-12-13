# Create the log folder if not exist
$log_path = "~\logs\backup\"

if (!(test-path $log_path))
{
    New-Item -ItemType Directory -Force -Path $log_path 
}

# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the document folder to OneDrive
$log = $today_string + "-Document-backup-OneDrive.txt"
cd $log_path
robocopy "D:\Storage\Dropbox\Documents\" "D:\Storage\OneDrive\Documents\" /mir /log:$log

