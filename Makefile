.PHONY: all clean data_validation

all: outputs/summary_statistics.csv outputs/income_vs_spent.png outputs/daily_sales_trend.png outputs/age_distribution.png outputs/age_group_statistics.csv reports/report.html reports/report.pdf docs/index.html data_validation

# output generation
outputs/summary_statistics.csv: scripts/analyze_sales.R
	Rscript scripts/analyze_sales.R --input=data/customer_sales.csv --output_dir=outputs

outputs/income_vs_spent.png: scripts/analyze_sales.R
	Rscript scripts/analyze_sales.R --input=data/customer_sales.csv --output_dir=outputs

outputs/daily_sales_trend.png: scripts/visualize_data.R
	Rscript scripts/visualize_data.R --input=data/customer_sales.csv --output_dir=outputs

outputs/age_distribution.png: scripts/visualize_data.R
	Rscript scripts/visualize_data.R --input=data/customer_sales.csv --output_dir=outputs

outputs/age_group_statistics.csv: scripts/visualize_data.R
	Rscript scripts/visualize_data.R --input=data/customer_sales.csv --output_dir=outputs


# data validation
data_validation: scripts/data_validation.R
	Rscript scripts/data_validation.R 

# report generation
reports/report.html: reports/report.qmd
	quarto render reports/report.qmd --to html

reports/report.pdf: reports/report.qmd
	quarto render reports/report.qmd --to pdf

docs/index.html: reports/report.html
	cp reports/report.html docs/index.html

clean:
	rm -rf outputs/*
	rm -rf reports/report.html
	rm -rf reports/report.pdf
	rm -rf docs/index.html
	rm -rf outputs/data_validation.html
