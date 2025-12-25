-- ==============================
-- MONTHLY REVENUE TREND
-- ==============================
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY year, month
ORDER BY year, month;

-- ==============================
-- TOP 5 CUSTOMERS BY REVENUE
-- ==============================
SELECT
    customer_id,
    SUM(revenue) AS total_spent
FROM warehouse.fact_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- ==============================
-- REVENUE BY COUNTRY
-- ==============================
SELECT
    country,
    SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY country
ORDER BY total_revenue DESC;

-- ==============================
-- PAYMENT METHOD ANALYSIS
-- ==============================
SELECT
    payment_type,
    COUNT(*) AS transactions,
    SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY payment_type
ORDER BY total_revenue DESC;

-- ==============================
-- DISCOUNT IMPACT
-- ==============================
SELECT
    discount,
    SUM(revenue) AS revenue
FROM warehouse.fact_sales
GROUP BY discount
ORDER BY discount;

-- ==============================
-- RUNNING TOTAL REVENUE
-- ==============================
SELECT
    order_date,
    SUM(revenue) OVER (ORDER BY order_date) AS running_revenue
FROM warehouse.fact_sales;

-- ==============================
-- AVERAGE ORDER VALUE
-- ==============================
SELECT AVG(revenue) AS avg_order_value
FROM warehouse.fact_sales;

-- ==============================
-- CUSTOMER LIFETIME VALUE
-- ==============================
SELECT
    customer_id,
    SUM(revenue) AS lifetime_value
FROM warehouse.fact_sales
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- ==============================
-- TOP SELLING PRODUCTS
-- ==============================
SELECT
    product_id,
    SUM(quantity) AS total_units_sold
FROM warehouse.fact_sales
GROUP BY product_id
ORDER BY total_units_sold DESC;

-- ==============================
-- DAILY REVENUE VARIANCE
-- ==============================
SELECT
    order_date,
    revenue - LAG(revenue) OVER (ORDER BY order_date) AS revenue_change
FROM warehouse.fact_sales;

-- Basic data quality check
SELECT COUNT(*) AS null_issues
FROM warehouse.fact_sales
WHERE customer_id IS NULL
   OR product_id IS NULL
   OR order_date IS NULL;
