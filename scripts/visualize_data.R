# Load required packages
library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)
library(lubridate)

# Create outputs directory if it doesn't exist
dir.create("../outputs", showWarnings = FALSE)

# Read the data
df <- read_csv("../data/customer_sales.csv") %>%
  mutate(date = as.Date(date))

# Calculate daily sales
daily_sales <- df %>%
  group_by(date) %>%
  summarise(total_sales = sum(total_spent))

# Create daily sales trend plot
ggplot(daily_sales, aes(x = date, y = total_sales)) +
  geom_line() +
  geom_point() +
  labs(title = "Daily Sales Trend",
       x = "Date",
       y = "Total Sales ($)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))
ggsave("../outputs/daily_sales_trend.png", width = 12, height = 6)

# Create age distribution plot
ggplot(df, aes(x = age, fill = gender)) +
  geom_histogram(bins = 5, position = "stack") +
  labs(title = "Age Distribution by Gender",
       x = "Age",
       y = "Count") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))
ggsave("../outputs/age_distribution.png", width = 10, height = 6)

# Calculate and save average spending by age group
age_group_stats <- df %>%
  mutate(age_group = cut(age, 
                        breaks = c(20, 30, 40, 50, 60),
                        labels = c("20-30", "31-40", "41-50", "51-60"))) %>%
  group_by(age_group) %>%
  summarise(
    mean_spent = mean(total_spent),
    count = n()
  )

write_csv(age_group_stats, "../outputs/age_group_statistics.csv") 