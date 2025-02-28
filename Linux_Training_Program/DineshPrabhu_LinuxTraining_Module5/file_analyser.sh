#!/bin/bash

# Function to display help menu using here document
show_help() {
    cat << EOF
Usage: $0 [options]
Options:
    -d <directory>   Directory to search
    -k <keyword>     Keyword to search
    -f <file>        File to search directly
    --help           Display this help menu
Example usage:
    # Recursively search a directory for a keyword
    $0 -d logs -k error
    # Search for a keyword in a file
    $0 -f script.sh -k TODO
    # Display the help menu
    $0 --help
EOF
}

# Function to search for a keyword in a specified file using a here string
search_file() {
    file_content=$(cat "$1")
    if grep -q "$2" <<< "$file_content"; then
        echo "Found '$2' in '$1'"
    else
        echo "Keyword '$2' not found in '$1'"
    fi
}

# Recursive function to search for files in a directory and its subdirectories containing a specific keyword
search_directory() {
    for file in "$1"/*; do
        if [ -d "$file" ]; then
            search_directory "$file" "$2"
        elif [ -f "$file" ]; then
            search_file "$file" "$2"
        fi
    done
}

# Handle command-line arguments using getopts
while getopts "d:k:f:-:" opt; do
    case $opt in
        d) directory=$OPTARG ;;
        k) keyword=$OPTARG ;;
        f) file=$OPTARG ;;
        -)
            case $OPTARG in
                help) show_help; exit 0 ;;
                *) echo "Invalid option: --$OPTARG" ;;
            esac ;;
        \?) echo "Invalid option: -$OPTARG" ;;
        :) echo "Option -$OPTARG requires an argument." ;;
    esac
done

# Display help menu if no arguments are provided
if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

# Perform actions based on provided options
if [ -n "$directory" ] && [ -n "$keyword" ]; then
    if [[ ! -d "$directory" ]]; then
        echo "Error: Directory '$directory' does not exist."
        echo "Error: Directory '$directory' does not exist." >> errors.log
        exit 1
    fi
    search_directory "$directory" "$keyword"
elif [ -n "$file" ] && [ -n "$keyword" ]; then
    if [[ ! -e "$file" ]]; then
        echo "Error: File '$file' does not exist."
        echo "Error: File '$file' does not exist." >> errors.log
        exit 1
    fi

    if [[ -z "$keyword" ]]; then
        echo "Error: Keyword is empty."
        echo "Error: Keyword is empty." >> errors.log
        exit 1
    fi

    search_file "$file" "$keyword"
else
    echo "Error: Missing required arguments."
    echo "Error: Missing required arguments." >> errors.log
    show_help
    exit 1
fi

# Provide meaningful feedback using special parameters
echo "-----------------------------------"
echo "Script name: $0"
echo "Number of arguments: $#"
echo "Exit status of the last command: $?"
echo "All arguments: $@"
echo "-----------------------------------"
