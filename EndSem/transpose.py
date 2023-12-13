#!/usr/bin/python3

import csv, sys

if(len(sys.argv) != 2):
    print("Usage: %s [matrixfile]" % sys.argv[0])
    sys.exit(1)

CSVFILE=sys.argv[1]

f=open(CSVFILE)
csvreader=csv.reader(f, delimiter=",")
M=[]
for row in csvreader:
    M.append(row)

def transpose(M):
    # Assume M is rectangular and return its transpose matrix
    # Assume that argument M is a list of lists
    # You can also assume that M has at least one row and one column
    # Marks: 1 mark for correctness, 1 mark for single line solution
    ########## BEGIN_YOUR_CODE ##########
    return [[r[i] for r in M] for i in range(len(M[0]))]
    ########## END_YOUR_CODE ##########

MT=transpose(M)

OUTFILE="/tmp/transpose.csv"
wf=open(OUTFILE, 'w', newline='\n')
csvwriter=csv.writer(wf, delimiter=",")
for row in MT:
    csvwriter.writerow(row)
wf.close()
