-- DATE DIMENSION
DROP TABLE IF EXISTS warehouse.dim_date;

CREATE TABLE warehouse.dim_date AS
SELECT DISTINCT
    CAST(order_date AS DATE) AS order_date,
    EXTRACT(YEAR  FROM CAST(order_date AS DATE)) AS year,
    EXTRACT(MONTH FROM CAST(order_date AS DATE)) AS month,
    EXTRACT(DAY   FROM CAST(order_date AS DATE)) AS day
FROM staging.sales_data;

-- CUSTOMER DIMENSION
DROP TABLE IF EXISTS warehouse.dim_customer;

CREATE TABLE warehouse.dim_customer AS
SELECT DISTINCT
    customer_id,
    country
FROM staging.sales_data;

-- PRODUCT DIMENSION
DROP TABLE IF EXISTS warehouse.dim_product;

CREATE TABLE warehouse.dim_product AS
SELECT DISTINCT
    product_id,
    price
FROM staging.sales_data;

-- PAYMENT METHOD DIMENSION
DROP TABLE IF EXISTS warehouse.dim_payment_method;

CREATE TABLE warehouse.dim_payment_method AS
SELECT DISTINCT
    payment_type AS payment_method
FROM staging.sales_data;
