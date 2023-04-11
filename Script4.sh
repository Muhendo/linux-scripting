#!/bin/bash

# Set backup directory
backup_dir="/backup"

# Set NAS directory
nas_dir="/nas"

# Set users to backup
users=("user1" "user2" "user3" "user4" "user5")

# Loop through users and backup their home directories
for user in "${users[@]}"; do
    # Set source directory
    src_dir="/home/${user}"
    
    # Set backup filename
    backup_file="${user}_$(date +"%Y-%m-%d").tar.gz"
    
    # Create backup archive
    tar czf "${backup_dir}/${backup_file}" "${src_dir}"
    
    # Copy backup archive to NAS
    cp "${backup_dir}/${backup_file}" "${nas_dir}"
done
