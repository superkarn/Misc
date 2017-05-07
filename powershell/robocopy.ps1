# Backs up the picture folder to drive G
robocopy "D:\Pictures\" "G:\Data\Backup\Pictures\" /mir /log:Picture-backup-G.txt

# Backs up the picture folder to drive F
robocopy "D:\Pictures\" "F:\Data\Backup\Pictures\" /mir /log:Picture-backup-F.txt
