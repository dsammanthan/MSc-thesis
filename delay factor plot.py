import pandas as pd
import matplotlib.pyplot as plt

# Data from your table
data = {
    "Country": ["USA", "China", "Germany", "Japan", "India"],
    "Mean": [1.17, 1.15, 1.24, 1.12, 1.07],
    "Max": [1.22, 1.37, 1.89, 1.38, 1.10]
}

df = pd.DataFrame(data)

# Calculate percentage increase: ((Max - Mean) / Mean) * 100
df["Pct_Increase"] = ((df["Max"] - df["Mean"]) / df["Mean"]) * 100
plt.figure(figsize=(8, 5))
plt.bar(df["Country"], df["Pct_Increase"], color="blue")
plt.ylabel("Percentage Increase (Max vs Mean) [%]")
#plt.xlabel("Country")
plt.title("Percentage Increase between Max and Mean Avg. Delay Factor")
plt.ylim(0, df["Pct_Increase"].max() + 10)

# Add value labels on bars
for idx, value in enumerate(df["Pct_Increase"]):
    plt.text(idx, value + 0.5, f"{value:.1f}", ha='center', va='bottom')

plt.tight_layout()
plt.show()
