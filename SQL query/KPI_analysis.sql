-- KPI analysis

-- revenue
SELECT SUM(total_payment)
FROM fact_orders_clean;

-- total customer
SELECT COUNT(DISTINCT customer_id)
FROM fact_orders_clean;

-- monthly revenue
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(total_payment) AS revenue
FROM fact_orders_clean
GROUP BY 
    YEAR(order_date),
    MONTH(order_date)
ORDER BY year, month;