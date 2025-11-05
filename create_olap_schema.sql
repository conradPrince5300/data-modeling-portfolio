CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT,
    full_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE dim_product (
    product_key SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    date_value DATE,
    day INT,
    month INT,
    year INT
);

CREATE TABLE dim_payment (
    payment_key SERIAL PRIMARY KEY,
    payment_method VARCHAR(50)
);

CREATE TABLE fact_sales (
    sales_key SERIAL PRIMARY KEY,
    order_id INT,
    customer_key INT REFERENCES dim_customer(customer_key),
    product_key INT REFERENCES dim_product(product_key),
    payment_key INT REFERENCES dim_payment(payment_key),
    date_key INT REFERENCES dim_date(date_key),
    quantity INT,
    total_amount DECIMAL(10, 2)
);
