
# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Back up the picture folder to drive G
$destination_path = "G:\Data\Backup"
$log_filename = "$destination_path\$today_string-Picture-backup-G.txt"
#echo "D:\SharedPictures\" "$destination_path\Pictures\" "/mir /log:$log_g"
robocopy "D:\SharedPictures\" "$destination_path\Pictures\" /mir /log:$log_filename



# Back up the picture folder to drive F
$destination_path = "F:\Data\Backup"
$log_filename = "$destination_path\$today_string-Picture-backup-F.txt"
#echo "D:\SharedPictures\" "$destination_path\Pictures\" "/mir /log:$log_g"
robocopy "D:\SharedPictures\" "$destination_path\Pictures\" /mir /log:$log_filename


# Back up the picture folder to drive H
$destination_path = "H:\Data\Backup"
$log_filename = "$destination_path\$today_string-Picture-backup-H.txt"
robocopy "D:\SharedPictures\" "$destination_path\Pictures\" /mir /log:$log_filename


# Back up the picture folder to AmazonPhotos folder, copying only jpgs
$destination_path = "G:\Data\AmazonCloudDrive"
$log_filename = "$destination_path\$today_string-AmazonPhotos-backup.txt"
robocopy "D:\SharedPictures\" "$destination_path\Pictures\Backup" *.jpg /mir /log:$log_filename
