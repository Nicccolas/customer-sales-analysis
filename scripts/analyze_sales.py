import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os

# Create outputs directory if it doesn't exist
os.makedirs('../outputs', exist_ok=True)

# Read the data
df = pd.read_csv('../data/customer_sales.csv')

# Calculate summary statistics
summary_stats = df.describe()
gender_stats = df.groupby('gender')['total_spent'].agg(['mean', 'count'])

# Save summary statistics to CSV
summary_stats.to_csv('../outputs/summary_statistics.csv')
gender_stats.to_csv('../outputs/gender_statistics.csv')

# Create a correlation heatmap
plt.figure(figsize=(10, 8))
correlation_matrix = df[['age', 'income', 'items_purchased', 'total_spent']].corr()
sns.heatmap(correlation_matrix, annot=True, cmap='coolwarm', center=0)
plt.title('Correlation Heatmap of Customer Metrics')
plt.tight_layout()
plt.savefig('../outputs/correlation_heatmap.png')
plt.close()

# Create income vs total spent scatter plot
plt.figure(figsize=(10, 6))
sns.scatterplot(data=df, x='income', y='total_spent', hue='gender')
plt.title('Income vs Total Spent by Gender')
plt.xlabel('Income ($)')
plt.ylabel('Total Spent ($)')
plt.tight_layout()
plt.savefig('../outputs/income_vs_spent.png')
plt.close() 