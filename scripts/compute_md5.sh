#!/bin/bash
source config.sh

base_directory="$1"
hostname=$(hostname)
base_directory_named=$(echo "$base_directory" | sed -e 's/\//_/g')
EXPORT_FILE="/mnt/RAID/MediaTeX/log/md5exports_${hostname}_${base_directory_named}.log"
touch "$EXPORT_FILE"
find "$base_directory" -type f | while read i; do
			    name=$(readlink -f "$i");
			    md5sum "$name" >> "$EXPORT_FILE"
			done

					
