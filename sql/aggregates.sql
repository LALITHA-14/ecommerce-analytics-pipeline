-- DAILY SALES AGGREGATE
DROP TABLE IF EXISTS warehouse.daily_sales_agg;

CREATE TABLE warehouse.daily_sales_agg AS
SELECT
    order_date,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity
FROM warehouse.fact_sales
GROUP BY order_date;

-- CUSTOMER SUMMARY
DROP TABLE IF EXISTS marts.sales_summary;

CREATE TABLE marts.sales_summary AS
SELECT
    customer_id,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM warehouse.fact_sales
GROUP BY customer_id;

-- PRODUCT SUMMARY
DROP TABLE IF EXISTS marts.product_summary;

CREATE TABLE marts.product_summary AS
SELECT
    product_id,
    SUM(revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM warehouse.fact_sales
GROUP BY product_id;
