# Load required packages
library(tidyverse)
library(docopt)

remotes::install_github("Nicccolas/sales_package")
library(salespackage)

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
    scatter_plot <- scatter(df, x = "income", y = "total_spent")
    ggsave(file.path(output_dir, "income_vs_spent.png"), scatter_plot, width = 8, height = 6) 

}

analyze_sales(opt$input, opt$output_dir)