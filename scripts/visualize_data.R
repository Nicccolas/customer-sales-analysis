# Load required packages
library(tidyverse)
library(docopt)

"This script loads and cleans the dataset.

Usage:
  visualize_data.R --input=<input_file> --output_dir=<output_dir>

Options:
  --input=<input_file>    Path to raw data CSV file
  --output_dir=<output_dir>   Path to save outputs
" -> doc

opt <- docopt(doc)

visualize_data <- function(input_file, output_dir) {

    # Read and analyze data
    df <- read_csv(input_file) %>%
    mutate(date = as.Date(date))

    # Calculate and plot daily sales
    daily_sales <- df %>%
    group_by(date) %>%
    summarise(total_sales = sum(total_spent))

    daily_sales_plot <- ggplot(daily_sales, aes(x = date, y = total_sales)) +
    geom_line() +
    geom_point() +
    labs(title = "Daily Sales Trend",
        x = "Date",
        y = "Total Sales ($)") +
    theme_minimal()
    ggsave(file.path(output_dir, "daily_sales_trend.png"), daily_sales_plot, width = 8, height = 6)

    # Create age distribution plot
    age_distribution_plot <- ggplot(df, aes(x = age, fill = gender)) +
    geom_histogram(bins = 5, position = "stack") +
    labs(title = "Age Distribution by Gender",
        x = "Age",
        y = "Count") +
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))
    ggsave(file.path(output_dir, "age_distribution.png"), age_distribution_plot, width = 10, height = 6)

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

    write_csv(age_group_stats, file.path(output_dir, "age_group_statistics.csv")) 

}

visualize_data(opt$input, opt$output_dir)