#!/bin/bash

# This script should take input from STDIN, assuming that it is the
# contents of a C code file.  It should then print the names of all
# the included files, included using "", not those using <>.  The
# included files' names must be printed one in each line of output.

# In writing the script, you can further assume that the relevant
# include statements in the input are NOT within any commented
# section.

# Hint: I used the sed command to print and another sed invocation to
# substitute as necessary

# Marking: 6 marks total

# 2 marks for basic working

# 2 additional marks for handling spaces and tabs within the include
# statement (see test cases given)

# 2 additional marks for single line solution.  (You can use
# pipes via multiple commands, but you cannot use ';' or '&&' or any
# other means to fake multiple statements in the same line)

# START

sed -n '/^[ \t]*#[ \t]*include[ \t]*"/p' - | sed 's/[^"]*"//; s/".*$//'

# END
