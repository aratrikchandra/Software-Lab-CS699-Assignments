import csv
import sys
def get_data(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        data = []
        for line in reader:
            if line[0].isdigit():
                data.append(line)

        selection_list=list(filter(lambda x: int(x[-1])==1,data))
    return selection_list


if len(sys.argv) != 2:
    print("Usage: q1.py <csv-file-name>")
    sys.exit(1)
filename = sys.argv[1]
selection_list = get_data(filename)
print(selection_list)
print(len(selection_list))
