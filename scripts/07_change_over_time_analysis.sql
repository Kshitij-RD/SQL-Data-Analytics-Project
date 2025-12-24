/*
===============================================================================
Change Over Time Analysis — MySQL Version
Standardized to Monthly Format: YYYY-MM-01
===============================================================================
Purpose:
    - Track trends, growth, and changes in key metrics over time.
    - Produce consistent month buckets across all queries.
===============================================================================
*/

---------------------------------------------------------
-- 1. Sales performance over time (monthly)
---------------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

---------------------------------------------------------
-- 2. Detailed breakdown (year–month aggregation, but unified to YYYY-MM-01)
---------------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;

---------------------------------------------------------
-- 3. Equivalent of FORMAT(order_date, 'yyyy-MMM')
--    but standardized to YYYY-MM-01
---------------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m-01') AS order_month,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold_fact_sales
WHERE order_date IS NOT NULL
GROUP BY order_month
ORDER BY order_month;
