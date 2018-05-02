# Get today's date
$today = get-date
$today_string = $today.ToString("yyyy-MM-dd")

# Backs up the picture folder to drive G
$log_g = $today_string + "-Picture-backup-G.txt"
robocopy "D:\Pictures\" "G:\Data\Backup\Pictures\" /mir /log:$log_g

# Backs up the picture folder to drive F
$log_f = $today_string + "-Picture-backup-F.txt"
robocopy "D:\SharedPictures\" "F:\Data\Backup\Pictures\" /mir /log:log_f
