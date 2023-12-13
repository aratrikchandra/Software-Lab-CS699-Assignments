import csv
import sys
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
data = get_data(filename)
data.sort(key=lambda x: x[-1],reverse=True)


with open('output.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(data)