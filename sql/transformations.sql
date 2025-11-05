-- ===============================
-- STEP 1: Populate Dimension Tables
-- ===============================

-- Load unique customers into dim_customers
INSERT INTO dim_customers (customer_id, first_name, last_name, city)
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, c.city
FROM customers c;

-- Load unique products into dim_products
INSERT INTO dim_products (product_id, product_name, category, price)
SELECT DISTINCT p.product_id, p.product_name, p.category, p.price
FROM products p;

-- Load unique order dates into dim_date
INSERT INTO dim_date (date_value, year, month, day)
SELECT DISTINCT o.order_date,
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date),
    EXTRACT(DAY FROM o.order_date)
FROM orders o;

-- ===============================
-- STEP 2: Populate Fact Table
-- ===============================

INSERT INTO fact_sales (order_id, customer_key, product_key, date_key, quantity, total_price, payment_method)
SELECT 
    o.order_id,
    dc.customer_key,
    dp.product_key,
    dd.date_key,
    oi.quantity,
    oi.total_price,
    p.payment_method
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN dim_customers dc ON c.customer_id = dc.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN dim_products dp ON oi.product_id = dp.product_id
JOIN dim_date dd ON o.order_date = dd.date_value
JOIN payments p ON o.order_id = p.order_id;
