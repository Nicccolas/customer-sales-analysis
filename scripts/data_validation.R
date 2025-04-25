library(pointblank)
library(tidyverse)

df <- read_csv("data/customer_sales.csv")
agent <- df %>%
    create_agent() %>%
    col_vals_gt(customer_id, 0) %>%
    col_vals_in_set(gender, c("M", "F")) %>%
    col_vals_gt(age, 0) %>%
    col_vals_gt(income, 0) %>%
    col_vals_gt(total_spent, 0) %>%
    interrogate()

export_report(agent, filename = "data_validation.html", path = 'outputs/')