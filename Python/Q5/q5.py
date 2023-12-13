import csv
import sys
def get_data(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        dictoo = dict()
        for line in reader:
            if line[0]=='Sno':
                for i in range(len(line)):
                    dictoo[line[i]]=i
                break
    return dictoo


if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)
filename = sys.argv[1]
data = get_data(filename)

for key, value in data.items():
    print(key, value)
    