#!/bin/bash

echo "This is a (partial) test script to test get-c-files-with-main.sh"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

cmd="bash get-c-files-with-main.sh"
echo; echo
echo "Running $cmd"
echo "----Actual output is:-------------------------------------------------"
eval $cmd
echo "----------------------------------------------------------------------"
echo "----Expected output is:-----------------------------------------------"
cat <<EOF
main.c
EOF

cmd="mv temp-c-file1.c.tempext temp-c-file1.c; bash get-c-files-with-main.sh | sort; mv temp-c-file1.c temp-c-file1.c.tempext"
echo; echo
echo "Running $cmd"
echo "----Actual output is:-------------------------------------------------"
eval $cmd
echo "----------------------------------------------------------------------"
echo "----Expected output is:-----------------------------------------------"
cat <<EOF
main.c
temp-c-file1.c
EOF
