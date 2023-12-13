#!/bin/bash

echo "This is a (partial) test script to test gen-exe-deps.sh"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

cmd="bash gen-exe-deps.sh"

echo; echo
echo "Running $cmd"
echo "----Actual output is:-------------------------------------------------"
eval $cmd
echo "----------------------------------------------------------------------"
echo "----Expected output is: (order of deps not important) ----------------"
cat <<EOF
main: f1.o f2.o main.o
        gcc -o main  f1.o f2.o main.o
EOF
