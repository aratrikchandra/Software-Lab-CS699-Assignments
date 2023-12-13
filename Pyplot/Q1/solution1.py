import matplotlib.pyplot as plt
import csv

# Read data from file
with open('pip-latency-comparison.txt', 'r') as file:
    reader = csv.reader(file)
    next(reader)  # Skip the header
    data = list(reader)

# Separate data into different lists
hops = [int(row[0]) for row in data]
PIP = [float(row[1]) if row[1] != '' else None for row in data]
Flush = [float(row[2]) if row[2] != '' else None for row in data]
PSFQ = [float(row[3]) if row[3] != '' else None for row in data]
Fetch = [(int(row[0]), float(row[4])) if row[4] != '' else None for row in data]

# Filter out None values from Fetch
Fetch = [point for point in Fetch if point is not None]

# Set figure size
plt.figure(figsize=(10, 8))

# Plot line graphs
plt.plot(hops, PIP, color='red', marker='x', linestyle='solid', markersize=9, markeredgewidth=2, linewidth=2, label='PIP')
plt.plot(hops, Flush, color='blue', marker='+', linestyle='dashed', markersize=9, markeredgewidth=2, linewidth=2, label='Flush')
plt.plot(hops, PSFQ, color='black', marker='o', linestyle='dashdot', markersize=9, markeredgewidth=2, linewidth=2, label='PSFQ')
plt.plot([point[0] for point in Fetch], [point[1] for point in Fetch], color='green', marker='^', linestyle='dotted', markersize=9, markeredgewidth=2, linewidth=2, label='Fetch')

# Set labels and title
plt.xlabel('Number of Hops')
plt.ylabel('Latency (ms)')

# Display legend at the best location
plt.legend(loc='best')

# Display grid
plt.grid(True)

# Save figure as png file
plt.savefig('output1.png')

# Show the plot
plt.show()
