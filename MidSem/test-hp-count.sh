#!/bin/bash

echo "This is a (partial) test script to test hp-count.awk"
echo "It assumes that you DID NOT modify the example input files in any way after downloading"

function runcmd {
  cmd="awk -f hp-count.awk $*"

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
120050001,SIDDHARTH PATEL,House1,93,-1
120050002,JAIN SHUBHAM ANILKUMAR,House1,183,-4
120050005,AAKASH SAMEER DESHPANDE,House1,207,0
120050009,DEEPANJAN KUNDU,House1,211,0
EOF
  elif [ "$*" == "hp2.csv" ]; then
      cat <<EOF
120110009,VISHAL RAJIV AGARWAL,House2,291,-3
120010010,DARSH JAIDIP SHAH,House2,210,-3
120050008,ABHISHEK S THAKUR,House2,181,-11
120050012,DEEPAK VERMA,House2,162,0
120050014,ROYAL JAIN,House2,197,-13
EOF
  elif [ "$*" == "hp3.csv" ]; then
      cat <<EOF
120050066,KATAM HARINANDAN TEJA,House3,144,0
120050069,VAKULABHARANAM SUMANTH,House3,201,-3
120050022,JAYESH BAGERIYA,House3,114,-3
120050023,TAPISH RANIWAL,House3,184,-3
120050029,ABHINAV GUPTA,House3,254,0
120050032,DEEPENDRA PATEL,House3,178,-14
120050033,DHEERENDRA SINGH RATHOR,House3,185,-10
120050036,ZUBIN ARYA,House3,47,-16
120050037,ARPIT SINGH,House3,138,0
120050038,KOILADA HARISH,House3,238,0
EOF
  fi
  echo "----------------------------------------------------------------------"
}

for i in `seq 1 3`
do
  runcmd hp$i.csv
done
