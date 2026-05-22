-- making the fact_orders table into fact_orders_clean table

SELECT 
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp AS order_date,

    SUM(i.price) AS total_product_value,
    SUM(i.freight_value) AS total_shipping,

    p.total_payment

INTO fact_orders_clean
FROM olist_orders_dataset o

JOIN olist_order_items_dataset i 
    ON o.order_id = i.order_id

JOIN (
    SELECT order_id, SUM(payment_value) AS total_payment
    FROM olist_order_payments_dataset
    GROUP BY order_id
) p 
    ON o.order_id = p.order_id

GROUP BY 
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp,
    p.total_payment;

-- drop table
DROP TABLE fact_orders_clean;

-- check if there are no duplicates 
SELECT order_id, COUNT(*)
FROM fact_orders_clean
GROUP BY order_id
HAVING COUNT(*) > 1;

-- checks total
SELECT SUM(total_payment) 
FROM fact_orders_clean;
-- compare with this:
SELECT SUM(payment_value) 
FROM olist_order_payments_dataset;

-- checking top 10 headers
SELECT TOP 10 * FROM fact_orders_clean;

-- select all data from table
SELECT *
FROM fact_orders_clean;