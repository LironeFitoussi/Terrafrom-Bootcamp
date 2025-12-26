#!/bin/bash

# Script to create empty lesson.md files in all lesson folders that don't have one

# Find all directories that match the pattern "## - *" (lesson folders)
# and create lesson.md if it doesn't exist

find . -type d -regextype posix-extended -regex '.*/[0-9]+ - .*' | while read -r dir; do
    lesson_file="$dir/lesson.md"
    if [ ! -f "$lesson_file" ]; then
        touch "$lesson_file"
        echo "Created: $lesson_file"
    fi
done

echo "Done! All lesson folders now have lesson.md files."

