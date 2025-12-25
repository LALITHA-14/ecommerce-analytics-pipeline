-- ==============================
-- LOAD DIMENSIONS
-- ==============================

INSERT INTO warehouse.dim_date
SELECT DISTINCT
    CAST(order_date AS DATE),
    EXTRACT(YEAR FROM CAST(order_date AS DATE)),
    EXTRACT(MONTH FROM CAST(order_date AS DATE)),
    EXTRACT(DAY FROM CAST(order_date AS DATE))
FROM staging.sales_data;

INSERT INTO warehouse.dim_customer
SELECT DISTINCT
    customer_id,
    country
FROM staging.sales_data;

INSERT INTO warehouse.dim_product
SELECT DISTINCT
    product_id,
    price
FROM staging.sales_data;

INSERT INTO warehouse.dim_payment_method
SELECT DISTINCT
    payment_type
FROM staging.sales_data;

-- ==============================
-- LOAD FACT TABLE
-- ==============================

INSERT INTO warehouse.fact_sales
SELECT
    transaction_id,
    customer_id,
    product_id,
    CAST(order_date AS DATE),
    quantity,
    price,
    discount,
    (quantity * price) - discount AS revenue,
    payment_type
FROM staging.sales_data;
