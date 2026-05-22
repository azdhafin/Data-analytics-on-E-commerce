-- Creating fact_orders table

DROP TABLE fact_orders;

SELECT 
    o.order_id,
    o.customer_id,
    o.order_purchase_timestamp,
    o.order_status,

    c.customer_city,
    c.customer_state,

    i.product_id,
    i.price,
    i.freight_value,

    p.payment_value,
    p.payment_type,

    pr.product_category_name_english

INTO fact_orders
FROM olist_orders_dataset o

JOIN olist_customers_dataset c 
    ON o.customer_id = c.customer_id

JOIN olist_order_items_dataset i 
    ON o.order_id = i.order_id

JOIN olist_order_payments_dataset p 
    ON o.order_id = p.order_id

JOIN olist_products_dataset pr 
    ON i.product_id = pr.product_id;

-- checking the fact_orders table

select top 10 *
from fact_orders;

SELECT COUNT(*)
FROM fact_orders;

SELECT COUNT(*)
FROM fact_orders
WHERE product_category_name_english is NULL;

DROP TABLE dbo.olist_products_dataset;