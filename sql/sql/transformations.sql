-- Transform OLTP data into OLAP Star Schema

-- 1. Load Customers
INSERT INTO dim_customer (customer_id, first_name, last_name, city, country)
SELECT DISTINCT c.customer_id, c.first_name, c.last_name, c.city, c.country
FROM customers c;

-- 2. Load Products
INSERT INTO dim_product (product_id, product_name, category)
SELECT DISTINCT p.product_id, p.product_name, p.category
FROM products p;

-- 3. Load Dates
INSERT INTO dim_date (date_value, year, month, day)
SELECT DISTINCT 
    CAST(o.order_date AS DATE) AS date_value,
    EXTRACT(YEAR FROM o.order_date),
    EXTRACT(MONTH FROM o.order_date),
    EXTRACT(DAY FROM o.order_date)
FROM orders o;

-- 4. Load Payment Methods
INSERT INTO dim_payment (payment_method)
SELECT DISTINCT payment_method FROM payments;

-- 5. Load Fact Table
INSERT INTO fact_sales (
    order_id, customer_key, product_key, date_key, payment_key, quantity, total_amount
)
SELECT 
    o.order_id,
    dc.customer_key,
    dp.product_key,
    dd.date_key,
    dpay.payment_key,
    oi.quantity,
    oi.total_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
JOIN payments pay ON pay.order_id = o.order_id
JOIN dim_customer dc ON c.customer_id = dc.customer_id
JOIN dim_product dp ON p.product_id = dp.product_id
JOIN dim_date dd ON dd.date_value = o.order_date
JOIN dim_payment dpay ON pay.payment_method = dpay.payment_method;
