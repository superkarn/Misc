Import-Module "./BackupHelper"

# Documents
RoboCopy-From "D:\Storage\OneDrive\Documents" "\\WINDOWS-SERVER\shared-backup\Data\backup" "Documents"
RoboCopy-From "D:\Storage\OneDrive\Documents" "F:\Data\backup" "Documents"


# Pictures
RoboCopy-From "D:\SharedPictures" "\\WINDOWS-SERVER\shared-backup\Data\backup" "Pictures"
RoboCopy-From "D:\SharedPictures" "F:\Data\backup" "Pictures"

