# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the picture folder to drive G
$log_g = $today_string + "-Picture-backup-G.txt"
robocopy "D:\SharedPictures\" "G:\Data\Backup\Pictures\" /mir /log:$log_g

# Back up the picture folder to drive F
$log_f = $today_string + "-Picture-backup-F.txt"
robocopy "D:\SharedPictures\" "F:\Data\Backup\Pictures\" /mir /log:log_f

# Back up the picture folder to AmazonPhotos folder, copying only jpgs
$log_f = $today_string + "-AmazonPhotos-backup.txt"
Robocopy "D:\SharedPictures\" "G:\Data\AmazonCloudDrive\Pictures\" *.jpg /mir /log:log_f
