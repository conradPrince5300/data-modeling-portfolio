CREATE TABLE dim_customer (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
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
    date_value DATE UNIQUE,
    year INT,
    month INT,
    day INT
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
    date_key INT REFERENCES dim_date(date_key),
    payment_key INT REFERENCES dim_payment(payment_key),
    quantity INT,
    total_amount DECIMAL(10, 2)
);
