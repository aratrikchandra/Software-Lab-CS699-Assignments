#!/bin/bash

if [ "$#" -ne 1 ]; 
 then
    echo "Usage: photo-rename.sh path"
    exit 1
fi

if [ ! -d "$1" ];
 then
    echo "Directory does not exist."
    exit 2
fi

dir=$1

mkdir -p output

for file in "$dir"/*.jpg; 
  do
    file_name=$(basename "$file")
    regex="^([0-9]{2})([0-9]{2})([0-9]{4})(.*).jpg$"
    if [[ ${file_name} =~ ${regex} ]]
    then
    day=$(echo ${file_name} | sed -n 's/\(^[0-9]\{2\}\).*/\1/p')
    month=$(echo ${file_name} | sed -n 's/^.\{2\}\([0-9]\{2\}\).*/\1/p')
    year=$(echo ${file_name} | sed -n 's/^.\{4\}\([0-9]\{4\}\).*/\1/p')
    other=$(echo ${file_name} | sed -n 's/^.\{8\}\(.*\).jpg$/\1/p')

        new_name="${year}-${month}-${day}-${other}.jpg"
        path="output/${new_name}"
        cp "$file" "$path"
    fi
done
