# Create the log folder if not exist
$log_path = "~\logs\backup\"

if (!(test-path $log_path))
{
    New-Item -ItemType Directory -Force -Path $log_path 
}

# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the picture folder to drive G
$log_g = "$log_path$today_string-Picture-backup-G.txt"
robocopy "D:\SharedPictures\" "G:\Data\Backup\Pictures\" /mir /log:$log_g

# Back up the picture folder to drive F
$log_f = "$log_path$today_string-Picture-backup-F.txt"
robocopy "D:\SharedPictures\" "F:\Data\Backup\Pictures\" /mir /log:$log_f

# Back up the picture folder to AmazonPhotos folder, copying only jpgs
$log_amzn = "$log_path$today_string-AmazonPhotos-backup.txt"
Robocopy "D:\SharedPictures\" "G:\Data\AmazonCloudDrive\Pictures\Backup" *.jpg /mir /log:$log_amzn
