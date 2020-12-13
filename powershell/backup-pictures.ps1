# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the picture folder to drive G
$log_g = $today_string + "-Picture-backup-G.txt"
cd "~\logs\backup\"
robocopy "D:\SharedPictures\" "G:\Data\Backup\Pictures\" /mir /log:$log_g

# Back up the picture folder to drive F
$log_f = $today_string + "-Picture-backup-F.txt"
cd "~\logs\backup\"
robocopy "D:\SharedPictures\" "F:\Data\Backup\Pictures\" /mir /log:$log_f

# Back up the picture folder to AmazonPhotos folder, copying only jpgs
$log_amzn = $today_string + "-AmazonPhotos-backup.txt"
cd "~\logs\backup\"
Robocopy "D:\SharedPictures\" "G:\Data\AmazonCloudDrive\Pictures\Backup" *.jpg /mir /log:$log_amzn
