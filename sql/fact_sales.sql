DROP TABLE IF EXISTS warehouse.fact_sales;

CREATE TABLE warehouse.fact_sales AS
SELECT
    transaction_id,
    customer_id,
    product_id,
    CAST(order_date AS DATE) AS order_date,
    quantity,
    price,
    discount,
    revenue,
    payment_type
FROM staging.sales_data;

-- Validation checks
SELECT COUNT(*) FROM warehouse.fact_sales;

SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customers,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS null_products,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS null_dates
FROM warehouse.fact_sales;
