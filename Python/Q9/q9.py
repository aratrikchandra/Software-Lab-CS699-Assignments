import csv
import math
import sys

def average(lst):
    return sum(lst) / len(lst)

def variance(lst):
    avg = average(lst)
    return sum((x - avg) ** 2 for x in lst) / len(lst)

def standard_deviation(lst):
    return math.sqrt(variance(lst))

def covariance(lst1, lst2):
    avg1 = average(lst1)
    avg2 = average(lst2)
    return sum((x - avg1) * (y - avg2) for x, y in zip(lst1, lst2)) / len(lst1)

def correlation(lst1, lst2):
    return covariance(lst1, lst2) / (standard_deviation(lst1) * standard_deviation(lst2))

if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)

with open(sys.argv[1], 'r') as f:
    reader = csv.reader(f)
    data = [row for row in reader]

total_marks = [sum(float(mark) if mark != 'NA' else 0.0 for mark in row[1:-1]) for row in data if row[0].isdigit()]

selections = [int(row[-1]) for row in data if row[0].isdigit()]

print(f"The correlation between the total marks and the final selection is {correlation(total_marks, selections)}")

