import matplotlib.pyplot as plt
import csv
import numpy as np

# Read data from file
with open('roofnet-noise11.txt', 'r') as f:
    reader = csv.reader(f)
    headers = next(reader)
    data = list(reader)

# Convert data to lists for plotting
x = list(range(0, len(data)))
y1 = [int(row[0]) for row in data]
y2 = [int(row[1]) for row in data]
y3 = [int(row[3]) for row in data]

# Create figure and plot data
plt.figure(figsize=(10, 6))
plt.plot(x, y1, color='red', marker='x', linestyle='solid', markersize=9, markeredgewidth=2, linewidth=2, label=headers[0])
plt.plot(x, y2, color='blue', marker='+', linestyle='dashed', markersize=9, markeredgewidth=2, linewidth=2, label=headers[1])
plt.plot(x, y3, color='black', marker='o', linestyle='dashdot', markersize=9, markeredgewidth=2, linewidth=2, label=headers[3])

# Set labels and limits
plt.xlabel('Reading Number')
plt.ylabel('Silence Level (dBm)')
plt.ylim(-101, -70)
plt.yticks(np.arange(-100, -65, 5))
# Show legend and grid
plt.legend(loc='best')
plt.grid(True)

# Save and show the figure
plt.savefig('output2.png')
plt.show()
