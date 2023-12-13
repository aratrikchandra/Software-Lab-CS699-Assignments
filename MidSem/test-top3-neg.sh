#!/bin/bash

echo "This is a (partial) test script to test top3-neg.sh"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

function runcmd {
  cmd="bash top3-neg.sh $*"

  echo; echo
  echo "Test case $*"
  echo "Running $cmd"
  echo "----Actual output is:-------------------------------------------------"
  eval $cmd
  echo "----------------------------------------------------------------------"
  echo "----Expected output is: ----------------------------------------------"
  if [ "$*" == "hp1.csv" ]; then
      cat <<EOF
120040005,SIDDHARTHA KUMAR DUTTA,House1,247,-5
120050002,JAIN SHUBHAM ANILKUMAR,House1,183,-4
120050001,SIDDHARTH PATEL,House1,93,-1
EOF
  elif [ "$*" == "hp2.csv" ]; then
      cat <<EOF
120050014,ROYAL JAIN,House2,197,-13
120050008,ABHISHEK S THAKUR,House2,181,-11
120010010,DARSH JAIDIP SHAH,House2,210,-3
EOF
  elif [ "$*" == "hp3.csv" ]; then
      cat <<EOF
120050036,ZUBIN ARYA,House3,47,-16
120050032,DEEPENDRA PATEL,House3,178,-14
120050033,DHEERENDRA SINGH RATHOR,House3,185,-10
EOF
  fi
  echo "----------------------------------------------------------------------"
}

for i in `seq 1 3`
do
  runcmd hp$i.csv
done
