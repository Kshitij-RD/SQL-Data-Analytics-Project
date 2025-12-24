/*
===============================================================================
Cumulative Analysis — MySQL Version
===============================================================================
Purpose:
    - Calculate running totals or moving averages for key metrics.
    - Track performance over time cumulatively.
    - Useful for growth analysis and long-term trends.
===============================================================================
*/

-- Calculate total sales per year
-- and running cumulative metrics
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-01-01') AS order_date,   -- MySQL replacement for DATETRUNC(year,…)
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold_fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATE_FORMAT(order_date, '%Y-01-01')
) AS t
ORDER BY order_date;

