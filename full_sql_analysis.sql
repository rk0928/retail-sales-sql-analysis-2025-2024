##First 10 rows of sales_metrics table
SELECT * FROM sales_metrics LIMIT 10;

##Daily performance overview
SELECT date, gross_sales, net_sales, transactions
FROM sales_metrics
ORDER BY date;

##Sales Per Hour(SPH)
SELECT date, net_sales/hours_worked AS sales_per_hour
FROM sales_metrics;

##Average Transaction Value (AUS/ATV)
SELECT date, net_sales/transactions AS avg_transaction_value
FROM sales_metrics;

##Identify Best Sales Day
SELECT date,net_sales
FROM sales_metrics
ORDER BY net_sales DESC 
LIMIT 10;

##Event vs Non-Event Performance
SELECT event_day_flag, AVG(net_sales) AS avg_sales
FROM sales_metrics
GROUP BY event_day_flag;

##Year over Year Comparison
SELECT YEAR(date) AS year, SUM(net_sales) AS total_sales
FROM sales_metrics
GROUP BY YEAR(date)
ORDER BY year;

##Monthly Trends
SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(net_sales) AS total_sales
FROM sales_metrics
GROUP BY YEAR(date), MONTH(date)
ORDER BY year, month;

## Productivity (Transaction Per Hour)
SELECT date, transactions/hours_worked AS transactions_per_hour
FROM sales_metrics;

##Identify Slow Days
SELECT date, net_sales
FROM sales_metrics
WHERE net_sales < 500;

##Return Impact 
SELECT date(gross_sales - net_sales) AS returns
FROM sales_metrics;