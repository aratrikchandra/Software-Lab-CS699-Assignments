#!/usr/bin/python3

import csv, sys
import matplotlib.pyplot as plt
import numpy as np

if(len(sys.argv) != 3):
    print("Usage: %s [test-section] [all-data-file]" % sys.argv[0])
    sys.exit(1)

test_section=int(sys.argv[1])
CSVFILE=sys.argv[2]

f=open(CSVFILE)
csvreader=csv.reader(f, delimiter=",")

DATA = {}

for row in csvreader:
    year = int(row[0])
    if(not year in DATA.keys()):
        DATA[year] = []
    DATA[year].append([int(x) for x in row[1:]])

#print(DATA)
years=sorted(DATA.keys())
#years=[2019,2020]


########## QUESTION_SECTION_1 ##########
# Complete the function maxweek to return the maximum week number in the data for the given year, as stored in DATA
# Marks: 1 for correctness, 1 for single line solution
# Hint: I used list comprehension for the single line solution
def maxweek(year, DATA):
########## BEGIN_YOUR_CODE_SECTION_1 ##########
    return max([x[0] for x in DATA[year]])
########## END_YOUR_CODE_SECTION_1 ##########

if(test_section == 1):
    for y in years:
        print("%d: %d" % (y, maxweek(y, DATA)))
    exit(0)

# Set the variable minweeks to be the minimum of all the maxweek among all the years in DATA
# Note: in the graph, we will be computing all aggregate data until minweeks
minweeks = min([maxweek(year, DATA) for year in DATA.keys()])
#print(minweeks)

########## QUESTION_SECTION_2 ##########
# The function mortalitycount should give the aggregate (sum) of mortality count for the given year, until (and including) week uptoweek, and in the given age-band
# You can assume that agelower and ageupper are on the boundary of some age-band in the given data (see some examples given)
# Marks: 2 marks for correctness, 1 mark for single line solution
def mortalitycount(year, agelower, ageupper, uptoweek, DATA):
########## BEGIN_YOUR_CODE_SECTION_2 ##########
    return sum([r[3] for r in DATA[year] if (r[0]<=uptoweek and r[1]>=agelower and r[2]<=ageupper)])
    #mc = [r[3] for r in DATA[year]]
    #print(mc)
########## END_YOUR_CODE_SECTION_2 ##########

ageranges=[[0,44],[45,64],[65,150],[0,150]]
#ageranges=[[0,44]]
if(test_section == 2):
    for y in years:
        for ar in ageranges:
            mc=mortalitycount(y, ar[0], ar[1], minweeks, DATA)
            print("%d %d-%d %d" % (y, ar[0], ar[1], mc))
    exit(0)

########## QUESTION_SECTION_3 ##########
########## BEGIN_YOUR_CODE_SECTION_3 ##########
# Write code to set variable TABLE to be a list of lists
# Each row should correspond to an age-range in ageranges
# Each column should correspond to a year in years
# Marks: 2 marks for correctness, 1 mark for single line solution
TABLE=[[mortalitycount(y,ageranges[i][0],ageranges[i][1],minweeks,DATA) for y in years] for i in range(len(ageranges))]
########## END_YOUR_CODE_SECTION_3 ##########

if(test_section == 3):
    print(TABLE)
    exit(0)

# This function is not really used, but is to give you an idea of what to do in csv2html.l
def percexcess(num,base):
    return 100.0*(num-base)/base
#PERCTABLE=[[percexcess(TABLE[ari][yi],TABLE[ari][0]) for yi in range(len(years))] for ari in range(len(ageranges))]

#print(TABLE)
OUTFILE="/tmp/table.csv"
wf=open(OUTFILE, 'w', newline='\n')
csvwriter=csv.writer(wf, delimiter=",")
csvwriter.writerow(["agerange-year"] + years)
for i in range(len(ageranges)):
    csvwriter.writerow(["Age:"+str(ageranges[i][0])+"-"+str(ageranges[i][1])+"y"] + TABLE[i])
wf.close()

# Bar plot for first age-range
GRAPHFILE="/tmp/mortality.png"
agerangeindex=0 # Plot a bar graph for the first age-range in ageranges
ar=ageranges[agerangeindex]
mc=TABLE[agerangeindex]
ind = np.arange(len(years))
width = 0.20
########## QUESTION_SECTION_4 ##########
# Write code to plot a bar graph of the mortality counts of the chosen age-range ar
# Marks: 1 mark
# Hint: see the pyplot examples on flamingo for a bar graph
########## BEGIN_YOUR_CODE_SECTION_4 ##########
r1 = plt.bar(ind, mc, width, color='b')
########## END_YOUR_CODE_SECTION_4 ##########
plt.xlabel('Year')
plt.ylabel("Mortality count in weeks 1 to " + str(minweeks) + " Age: " + str(ar[0]) + "-" + str(ar[1]) + "y")
#plt.grid(b='on')
plt.xticks(ind, [str(y) for y in years])
plt.savefig(GRAPHFILE, bbox_inches='tight')
