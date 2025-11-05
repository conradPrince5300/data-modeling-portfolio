-- Create DimCustomers table
CREATE TABLE dim_customers (
    customer_key SERIAL PRIMARY KEY,
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create DimProducts table
CREATE TABLE dim_products (
    product_key SERIAL PRIMARY KEY,
    product_id INT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Create DimDate table
CREATE TABLE dim_date (
    date_key SERIAL PRIMARY KEY,
    date_value DATE,
    year INT,
    month INT,
    day INT
);

-- Create FactSales table
CREATE TABLE fact_sales (
    sales_key SERIAL PRIMARY KEY,
    order_id INT,
    customer_key INT,
    product_key INT,
    date_key INT,
    quantity INT,
    total_price DECIMAL(10,2),
    payment_method VARCHAR(30),
    FOREIGN KEY (customer_key) REFERENCES dim_customers(customer_key),
    FOREIGN KEY (product_key) REFERENCES dim_products(product_key),
    FOREIGN KEY (date_key) REFERENCES dim_date(date_key)
);
