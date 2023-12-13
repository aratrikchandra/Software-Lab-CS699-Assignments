import csv
import sys
def twodlist(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        data = []
        for line in reader:
            if line[0].isdigit():
                data.append(line)
    return data


if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)
filename = sys.argv[1]
data = twodlist(filename)
print(data)
print(len(data))
