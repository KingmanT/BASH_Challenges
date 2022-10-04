#!/bin/bash

# Pass a filename through command-line.
# Delete all the empty lines from that file and save it back.

echo "Enter the name and extension of a file that you would like to have empty lines removed from"
read file
echo "Would you like to overwrite the existing file after removing empty lines or save as a new file?"
echo "Please type 'overwrite','new', or 'cancel' to exit without saving"
read save
if [ $save = "overwrite" ]; then
    sed '/^$/d' $file > $file
    echo "File overwritten"
elif [ $save = "new" ]; then
    echo "Enter a new file name and extension"
    read new_file
    sed '/^$/d' $file > $new_file
    echo "$new_file created"
else
    echo "exiting program"
fi
exit 0