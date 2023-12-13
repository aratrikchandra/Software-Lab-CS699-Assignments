#!/bin/bash

echo "This is a (partial) test script to test included-files.sh"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

for f in main.c f1.c f2.c
do

  cmd="bash included-files.sh <$f"

  echo; echo
  echo "Test case $f"
  echo "Running $cmd"
  echo "----Actual output is:-------------------------------------------------"
  eval $cmd
  echo "----------------------------------------------------------------------"
  echo "----Expected output is:-----------------------------------------------"
  if [ $f == "main.c" ]; then
      cat <<EOF
main.h
f1.h
some-non-existent-file.h
EOF
  elif [ $f == "f1.c" ]; then
      cat <<EOF
f1.h
another-non-existent-file.h
EOF
  elif [ $f == "f2.c" ]; then
      cat <<EOF
f2.h
f3.h
EOF
  fi
  echo "----------------------------------------------------------------------"
done
