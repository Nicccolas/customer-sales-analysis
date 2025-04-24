# Load required packages
library(tidyverse)
library(docopt)

"This script loads and cleans the dataset.

Usage:
  analyze_sales.R --input=<input_file> --output_dir=<output_dir>

Options:
  --input=<input_file>    Path to raw data CSV file
  --output_dir=<output_dir>   Path to save outputs
" -> doc

opt <- docopt(doc)

analyze_sales <- function(input_file, output_dir) {
    # Read and analyze data
    df <- read_csv(input_file)

    # Basic summary statistics
    summary_stats <- summary(df)
    write_csv(as.data.frame(summary_stats), file.path(output_dir, "summary_statistics.csv"))

    # Simple scatter plot
    scatter_plot <- ggplot(df, aes(x = income, y = total_spent)) +
    geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Income vs Total Spent",
        x = "Income ($)",
        y = "Total Spent ($)") +
    theme_minimal()
    ggsave(file.path(output_dir, "income_vs_spent.png"), scatter_plot, width = 8, height = 6) 

}

analyze_sales(opt$input, opt$output_dir)