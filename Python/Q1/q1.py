import csv
import sys

def no_of_candidates(filename):
    with open(filename, 'r') as file:
        content = csv.reader(file)
        count = 0
        for line in content:
            if line[0].isdigit():
                count += 1
    return count

if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)
filename = sys.argv[1]
print(no_of_candidates(filename))