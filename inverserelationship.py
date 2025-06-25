import pandas as pd
import matplotlib.pyplot as plt

# Data from your table
data = {
    "Country": ["USA", "China", "Germany", "Japan", "India"],
    "Mean": [1.17, 1.15, 1.24, 1.12, 1.07],
    "Std. dev": [0.00535, 0.01974, 0.03529, 0.0201, 0.00322217]
}

df = pd.DataFrame(data)

# Calculate percentage of std dev relative to mean
df["Std.dev_proportion"] = (df["Std. dev"] / df["Mean"]) * 100

# Example values for the red line plot (replace with your actual data as needed)
line_values = [1.94, 1.68, 0.14, 0.33, 1.33]

plt.figure(figsize=(8, 5))

# Bar plot
plt.bar(df["Country"], df["Std.dev_proportion"], color="blue", label="Std. dev. of avg. delay factor as a percentage of mean")

# Line plot with red markers
plt.plot(df["Country"], line_values, color='red', marker='o', linestyle='-', linewidth=2, markersize=8, label='Std. dev. of capital-to-capital links used')

#plt.ylabel("Percentage (%)")
#plt.xlabel("Country")
plt.title("Std. dev. proportion for delay factor and for capital-to-capital link usage")
plt.ylim(0, max(df["Std.dev_proportion"].max(), max(line_values)) + 1)

# Add value labels on bars
for idx, value in enumerate(df["Std.dev_proportion"]):
    plt.text(idx, value + 0, f"{value:.2f}%", ha='center', va='bottom', color='black')

# Add value labels on line plot
for idx, value in enumerate(line_values):
    plt.text(idx, value + 0.4, f"{value:.2f}", ha='center', va='top', color='red')

plt.legend()
plt.tight_layout()
plt.show()
