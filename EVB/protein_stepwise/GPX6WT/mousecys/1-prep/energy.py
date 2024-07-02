import matplotlib.pyplot as plt
import json

# Load data from JSON file
with open('qaf.PlotData.json', 'r') as f:
    data = json.load(f)

# Define colors for each subplot
colors = ['maroon', 'blue', 'green', 'purple', 'red']  # Add more colors if needed

# Iterate over each plot in the data
for key, value in data.items():
    fig, ax = plt.subplots(figsize=(10, 6))  # Adjust the figsize parameter for desired size

    # Iterate over each subplot within the plot
    for i, (subplot_key, subplot_value) in enumerate(value['subplots'].items()):
        x = subplot_value['xdata']
        y = subplot_value['ydata']

        # Plot the data with lines (without markers)
        ax.plot(x, y, color=colors[i % len(colors)], label=subplot_key)

    # Set labels and title
    ax.set_xlabel('E1-E2 [kcal/mol]', fontsize=14)  # Increase font size for labels
    ax.set_ylabel('Free energy [kcal/mol]', fontsize=14)  # Increase font size for labels
    ax.set_title(key, fontsize=16)  # Increase font size for title

    # Add legend and adjust font sizes
    ax.legend(fontsize='large')  # Increase font size for legend

    # Customize tick labels font size
    ax.tick_params(axis='both', which='major', labelsize='large')  # Increase font size for tick labels
    ax.tick_params(axis='both', which='minor', labelsize='large')  # Increase font size for tick labels

    # Show the plot interactively
    plt.tight_layout()  # Adjust layout for better appearance
    plt.show()
    plt.close(fig)  # Close the current figure to free memory