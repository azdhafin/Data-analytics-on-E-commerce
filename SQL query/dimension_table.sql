-- creating dimension customer table

SELECT DISTINCT
	customer_id,
	customer_city,
	customer_state
INTO dim_customers
FROM fact_orders;

-- checking tables
SELECT TOP 10 * FROM dim_customers;

-- creating dimension product table
SELECT DISTINCT
    product_id,
    product_category_name_english AS product_category
INTO dim_products
FROM fact_orders;

-- checking tables
SELECT TOP 10 * FROM dim_products;

-- creating dimension date table
SELECT DISTINCT
    order_date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DATENAME(MONTH, order_date) AS month_name
INTO dim_date
FROM fact_orders_clean;

-- checking table
SELECT TOP 10 * FROM dim_date;