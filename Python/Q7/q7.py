import csv
import sys
import math
def get_data(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        data = []
        for line in reader:
            if line[0].isdigit():
              total_marks = sum(float(mark) if mark!="NA" else 0.0 for mark in line[1:-1])
              line.append(total_marks)
              data.append(line)
    return data


if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)
filename = sys.argv[1]
OverallM = get_data(filename)
OverallM.sort(key=lambda x: x[-1],reverse=True)
num_rows = len(OverallM)
t20rows = math.ceil(num_rows * 0.2)
b40rows = math.ceil(num_rows * 0.4)

top20pM = OverallM[:t20rows]
bot40pM = OverallM[-b40rows:]

with open('top20.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(top20pM)


with open('bot40.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(bot40pM)