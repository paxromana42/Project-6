#!/bin/bash

# This script performs incremental backups using rsync.

# Usage:
# ./backup.sh <source_dir> <target_dir>

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if the correct number of arguments is provided.
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <source_dir> <target_dir>"
    exit 1
fi

# Assign the first argument as the source directory.
SOURCE_DIR=$1

# Assign the second argument as the target directory.
TARGET_DIR=$2

# Define the backup directory structure
BACKUP_DIR="${TARGET_DIR}/backup_$(date +%Y%m%d_%H%M%S)"

# Create the backup directory.
mkdir -p "${BACKUP_DIR}"

# Perform the backup using rsync.
# Options used:
# -a: archive mode, preserves permissions, symlinks, etc.
# -z: compress file data during the transfer
# --link-dest: hardlink to files in this directory if unchanged
LINK_DEST=$(find "$TARGET_DIR" -maxdepth 1 -mindepth 1 -type d | sort | tail -n 1)

if [ -n "$LINK_DEST" ]; then
    rsync -az --link-dest="$LINK_DEST" "$SOURCE_DIR" "$BACKUP_DIR"
else
    rsync -az "$SOURCE_DIR" "$BACKUP_DIR"
fi

echo "Backup of $SOURCE_DIR completed successfully to $BACKUP_DIR"
