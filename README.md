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
- Python 3.8+
- pandas
- matplotlib
- seaborn
- quarto (for report generation)

## Usage

1. Install the required packages:
```bash
pip install -r requirements.txt
```

2. Run the analysis scripts:
```bash
python scripts/analyze_sales.py
python scripts/visualize_data.py
```

3. Generate the report:
```bash
quarto render reports/report.qmd
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 