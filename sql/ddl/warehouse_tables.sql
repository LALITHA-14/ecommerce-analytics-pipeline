-- ==============================
-- SCHEMAS
-- ==============================
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS warehouse;
CREATE SCHEMA IF NOT EXISTS marts;
CREATE SCHEMA IF NOT EXISTS analytics;

-- ==============================
-- DIMENSION TABLES
-- ==============================

DROP TABLE IF EXISTS warehouse.dim_date;
CREATE TABLE warehouse.dim_date (
    order_date DATE PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

DROP TABLE IF EXISTS warehouse.dim_customer;
CREATE TABLE warehouse.dim_customer (
    customer_id INT PRIMARY KEY,
    country VARCHAR(100)
);

DROP TABLE IF EXISTS warehouse.dim_product;
CREATE TABLE warehouse.dim_product (
    product_id INT PRIMARY KEY,
    price NUMERIC(10,2)
);

DROP TABLE IF EXISTS warehouse.dim_payment_method;
CREATE TABLE warehouse.dim_payment_method (
    payment_method VARCHAR(50) PRIMARY KEY
);

-- ==============================
-- FACT TABLE
-- ==============================

DROP TABLE IF EXISTS warehouse.fact_sales;
CREATE TABLE warehouse.fact_sales (
    transaction_id INT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    price NUMERIC(10,2),
    discount NUMERIC(5,2),
    revenue NUMERIC(10,2),
    payment_type VARCHAR(50)
);
