# Customer Sales Analysis

This repository contains a data analysis project focused on customer sales behavior and patterns.

## Project Structure

```
.
├── data/               # Contains raw data files
├── scripts/           # Contains analysis scripts
├── outputs/          # Contains generated figures and tables
└── reports/          # Contains the final report
```

## Data

The dataset (`customer_sales.csv`) contains information about customer demographics and purchasing behavior, including:
- Customer ID
- Age
- Gender
- Income
- Number of items purchased
- Total amount spent
- Purchase date

## Requirements

To run the analysis scripts, you'll need:
- R 4.0+
- tidyverse
- ggplot2
- dplyr
- tidyr
- readr
- quarto (for report generation)

## Usage

1. Install the required R packages:
```R
install.packages(c("tidyverse", "ggplot2", "dplyr", "tidyr", "readr", "quarto"))
```

2. Run the analysis scripts:
```R
Rscript scripts/analyze_sales.R
Rscript scripts/visualize_data.R
```

3. Generate the report:
```bash
quarto render reports/report.qmd
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 