import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os

# Create outputs directory if it doesn't exist
os.makedirs('../outputs', exist_ok=True)

# Read the data
df = pd.read_csv('../data/customer_sales.csv')
df['date'] = pd.to_datetime(df['date'])

# Calculate daily sales
daily_sales = df.groupby('date')['total_spent'].sum().reset_index()

# Create daily sales trend plot
plt.figure(figsize=(12, 6))
sns.lineplot(data=daily_sales, x='date', y='total_spent', marker='o')
plt.title('Daily Sales Trend')
plt.xlabel('Date')
plt.ylabel('Total Sales ($)')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig('../outputs/daily_sales_trend.png')
plt.close()

# Create age distribution plot
plt.figure(figsize=(10, 6))
sns.histplot(data=df, x='age', bins=5, hue='gender', multiple='stack')
plt.title('Age Distribution by Gender')
plt.xlabel('Age')
plt.ylabel('Count')
plt.tight_layout()
plt.savefig('../outputs/age_distribution.png')
plt.close()

# Calculate and save average spending by age group
df['age_group'] = pd.cut(df['age'], bins=[20, 30, 40, 50, 60], labels=['20-30', '31-40', '41-50', '51-60'])
age_group_stats = df.groupby('age_group')['total_spent'].agg(['mean', 'count'])
age_group_stats.to_csv('../outputs/age_group_statistics.csv') 