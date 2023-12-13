#!/bin/bash

# This script must examine the contents of each C file (with extention
# .c) in the current directory, and must print the names of ONLY those
# C files which have a "main" function definition.  Each such C file's
# name must be printed on a separate line.

# For the purpose of this question, assume that the main function
# prototype is the string 'main' preceded by 1 or more space/tab
# characters, and the string 'main' is followed by a '('. There may be
# 0 or any number of space/tab characters between 'main' and '(' .

# You can assume that the main function prototype appears in a single
# line and is not commented.

# Note that there can be other variables which can have the string
# 'main' as a substring

# Marks: 3 marks for correctness

# START

for fc in *.c
do
  num_main_lines=`sed -n '/[ \t]\+main[ \t]*(/p; /^main[ \t]*(/p' < $fc | wc -l`
  if [ $num_main_lines -gt 0 ]; then
      echo $fc
  fi
done

# END
