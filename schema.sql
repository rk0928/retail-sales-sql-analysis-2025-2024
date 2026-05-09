USE retail_analysis;
CREATE TABLE sales_metrics (
day VARCHAR(10),
date DATE,
hours_worked DECIMAL(4,1),
selling_hours DECIMAL(4,1),
gross_sales DECIMAL(10,2),
net_sales DECIMAL(10,2),
transactions TINYINT,
avg_unit_sales DECIMAL(10,2),
sales_per_hour DECIMAL(10,2),
event_month_flag INT,
event_day_flag INT,
event_name VARCHAR(50)
);

SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE '/Users/renoodle/Downloads/sales_metrics.csv'
INTO TABLE sales_metrics
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(day, @date, hours_worked, selling_hours, gross_sales, net_sales, transactions, avg_unit_sales, sales_per_hour, event_month_flag, event_day_flag, event_name)
SET date = STR_TO_DATE(@date, '%c/%e/%y');