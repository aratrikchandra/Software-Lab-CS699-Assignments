#!/bin/bash

# This while loop reads lines of input.txt one by one and prints messages on the screen
while read line;
do
	animal=$(echo $line | cut -d ':' -f 1)
	sound=$(echo $line | cut -d ':' -f 2)
	TEXT="Old McDonald had a farm ei-ei-o\nOn that farm he had a ANIMAL ei-ei-o\nWith a SOUND-SOUND here, SOUND-SOUND there\nHere a SOUND there a SOUND, everywhere SOUND-SOUND\n"
	echo -e $TEXT | sed "s/ANIMAL/$animal/g; s/SOUND/$sound/g" 
done

echo "Old McDonald had a farm ei-ei-o"
