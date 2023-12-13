import matplotlib.pyplot as plt
import csv

# Read data from file
with open('pip-channel-hop.txt', 'r') as file:
    reader = csv.reader(file)
    next(reader)  # Skip the header
    data = list(reader)

# Separate data into different lists
PktGap = [row[0] for row in data]
Without_Hopping = [float(row[1]) for row in data]
With_Hopping = [float(row[2]) for row in data]
Without_Interference = [float(row[3]) for row in data]

# Set figure size
plt.figure(figsize=(8, 6))

# Set bar width
bar_width = 0.30

# Set x-axis values
x_values = range(len(PktGap))

# Plot bar graphs and line graph
plt.bar(x_values, Without_Hopping, color='red', width=bar_width, edgecolor='black', label='Without-Hopping')
plt.bar([x + bar_width for x in x_values], With_Hopping, color='green', width=bar_width, hatch='//', edgecolor='black', label='With-Hopping')
plt.plot(x_values, Without_Interference, color='blue', marker='x', linestyle='dashed', markersize=9, markeredgewidth=2, linewidth=2, label='Without-Interference')

# Set x-axis labels to be at the center of the two bars
plt.xticks([x + bar_width / 2 for x in x_values], PktGap)

# Set y-axis limit
plt.ylim(0, 70)

# Set labels and title
plt.xlabel('WiFi inter-packet gap (ms)')
plt.ylabel('Throughput (Kbps)')

# Display legend at specified location
plt.legend(loc=(0.25, 0.70))

# Display grid
plt.grid(True)

# Save figure as png file
plt.savefig('output3.png')

# Show the plot
plt.show()
