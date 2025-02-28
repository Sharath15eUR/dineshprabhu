#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <source_directory> <backup_directory> <file_extension>"
    exit 1
fi

# Assign command-line arguments to variables
SOURCE_DIR="$1"
BACKUP_DIR="$2"
FILE_EXT="$3"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Creating backup directory '$BACKUP_DIR'..."
    mkdir -p "$BACKUP_DIR" || { echo "Error: Failed to create backup directory."; exit 1; }
fi

# Use globbing to find files with the specified extension in the source directory
files=("$SOURCE_DIR"/*"$FILE_EXT")

# Check if any files match the extension
if [ ${#files[@]} -eq 0 ]; then
    echo "No files with extension '$FILE_EXT' found in '$SOURCE_DIR'."
    exit 0
fi

# Initialize environment variable to track the number of files backed up
export BACKUP_COUNT=0

# Initialize variables for the report
TOTAL_FILES=0
TOTAL_SIZE=0

# Store the list of files in an array and print their names and sizes
echo "Files to be backed up:"
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        file_size=$(stat -c%s "$file")
        echo "File: $(basename "$file"), Size: $file_size bytes"
        TOTAL_FILES=$((TOTAL_FILES + 1))
        TOTAL_SIZE=$((TOTAL_SIZE + file_size))
    fi
done

# Perform the backup
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        backup_file="$BACKUP_DIR/$filename"

        # Check if the file already exists in the backup directory
        if [ -f "$backup_file" ]; then
            # Compare timestamps and overwrite only if the source file is newer
            if [ "$file" -nt "$backup_file" ]; then
                cp "$file" "$backup_file"
                echo "Overwritten: $filename"
                BACKUP_COUNT=$((BACKUP_COUNT + 1))
            else
                echo "Skipped (up to date): $filename"
            fi
        else
            # Copy the file to the backup directory
            cp "$file" "$backup_file"
            echo "Backed up: $filename"
            BACKUP_COUNT=$((BACKUP_COUNT + 1))
        fi
    fi
done

# Generate the summary report
REPORT_FILE="$BACKUP_DIR/backup_report.log"
{
    echo "Backup Summary Report"
    echo "---------------------"
    echo "Total files processed: $TOTAL_FILES"
    echo "Total size of files backed up: $TOTAL_SIZE bytes"
    echo "Backup directory: $BACKUP_DIR"
    echo "Total files backed up: $BACKUP_COUNT"
} > "$REPORT_FILE"

echo "Backup completed. Report saved to $REPORT_FILE."
