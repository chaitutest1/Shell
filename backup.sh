#!/bin/bash

# Define backup source and destination directories
backup_source="/path/to/backup/source"
backup_destination="/path/to/backup/destination"

# Define backup filename
backup_filename="backup_$(date +%Y%m%d_%H%M%S).tar"

# Create tar archive of backup source directory
tar -cvf "$backup_filename" "$backup_source"

# Compress the tar archive
gzip "$backup_filename"

# Encrypt the compressed tar archive
gpg --recipient "backup@example.com" --encrypt "$backup_filename.gz"

# Move the encrypted backup file to the backup destination
mv "$backup_filename.gz.gpg" "$backup_destination"
