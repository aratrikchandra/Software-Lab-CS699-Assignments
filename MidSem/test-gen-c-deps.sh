#!/bin/bash

echo "This is a (partial) test script to test gen-c-deps.sh"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

function runcmd {
  cmd="bash gen-c-deps.sh $*"

  echo; echo
  echo "Test case $*"
  echo "Running $cmd"
  echo "----Actual output is:-------------------------------------------------"
  eval $cmd
  echo "----------------------------------------------------------------------"
  echo "----Expected output is: (order of deps not important) ----------------"
  if [ "$*" == "main.c" ]; then
      cat <<EOF
main.o: main.c main.h f1.h some-non-existent-file.h
        gcc -c main.c
EOF
  elif [ "$*" == "f1.c" ]; then
      cat <<EOF
f1.o: f1.c f1.h another-non-existent-file.h
        gcc -c f1.c
EOF
  elif [ "$*" == "f1.c f2.c main.c" ]; then
      cat <<EOF
f1.o: f1.c f1.h another-non-existent-file.h
        gcc -c f1.c
f2.o: f2.c f2.h f3.h
        gcc -c f2.c
main.o: main.c main.h f1.h some-non-existent-file.h
        gcc -c main.c
EOF
  fi
  echo "----------------------------------------------------------------------"
}

runcmd main.c
runcmd f1.c
runcmd f1.c f2.c main.c
