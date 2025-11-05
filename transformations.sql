-- Populate dimension tables
INSERT INTO dim_customer (customer_id, full_name, city, country)
SELECT DISTINCT c.customer_id, c.first_name || ' ' || c.last_name, c.city, c.country
FROM customers c;

INSERT INTO dim_product (product_id, product_name, category)
SELECT DISTINCT p.product_id, p.product_name, p.category
FROM products p;

INSERT INTO dim_date (date_value, day, month, year)
SELECT DISTINCT order_date, EXTRACT(DAY FROM order_date), EXTRACT(MONTH FROM order_date), EXTRACT(YEAR FROM order_date)
FROM orders;

INSERT INTO dim_payment (payment_method)
SELECT DISTINCT payment_method FROM payments;

-- Populate fact table
INSERT INTO fact_sales (order_id, customer_key, product_key, payment_key, date_key, quantity, total_amount)
SELECT o.order_id,
       dc.customer_key,
       dp.product_key,
       dpay.payment_key,
       dd.date_key,
       oi.quantity,
       oi.total_price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN dim_customer dc ON dc.customer_id = c.customer_id
JOIN dim_product dp ON dp.product_id = oi.product_id
JOIN payments p ON o.order_id = p.order_id
JOIN dim_payment dpay ON dpay.payment_method = p.payment_method
JOIN dim_date dd ON dd.date_value = o.order_date;
