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

def count_attempts(matrix):
    counts = {i: sum(1 for row in matrix if row[i] != 'NA') for i in range(1, len(matrix[0]) - 2)}
    return counts

matrices = [OverallM, top20pM, bot40pM]
attempts = list(map(count_attempts, matrices))

print("Overall attempts:", attempts[0])
print("Top 20% attempts:", attempts[1])
print("Bottom 40% attempts:", attempts[2])
