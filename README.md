# Customer Sales Analysis

A simple R project for practicing data analysis and visualization. HAHAHAHA ADDRESSING ISSUE GITHUB

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

## Usage

1. Install the required R package:
```R
install.packages("tidyverse")
```

2. Run the analysis scripts:
```R
Rscript scripts/analyze_sales.R    # Generates summary stats and income vs spending plot
Rscript scripts/visualize_data.R   # Generates daily sales trend plot
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 