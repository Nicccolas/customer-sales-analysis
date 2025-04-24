# Load required packages
library(tidyverse)
library(ggplot2)
library(dplyr)
library(readr)

# Create outputs directory if it doesn't exist
dir.create("../outputs", showWarnings = FALSE)

# Read the data
df <- read_csv("../data/customer_sales.csv")

# Calculate summary statistics
summary_stats <- summary(df)
gender_stats <- df %>%
  group_by(gender) %>%
  summarise(
    mean_spent = mean(total_spent),
    count = n()
  )

# Save summary statistics to CSV
write_csv(as.data.frame(summary_stats), "../outputs/summary_statistics.csv")
write_csv(gender_stats, "../outputs/gender_statistics.csv")

# Create correlation heatmap
correlation_matrix <- cor(df %>% select(age, income, items_purchased, total_spent))
png("../outputs/correlation_heatmap.png", width = 800, height = 600)
corrplot::corrplot(correlation_matrix, 
                  method = "color",
                  type = "upper",
                  addCoef.col = "black",
                  tl.col = "black",
                  tl.srt = 45,
                  title = "Correlation Heatmap of Customer Metrics")
dev.off()

# Create income vs total spent scatter plot
ggplot(df, aes(x = income, y = total_spent, color = gender)) +
  geom_point(size = 3) +
  labs(title = "Income vs Total Spent by Gender",
       x = "Income ($)",
       y = "Total Spent ($)") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))
ggsave("../outputs/income_vs_spent.png", width = 10, height = 6) 