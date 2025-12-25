-- 1. Monthly revenue trend
SELECT year, month, SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY year, month
ORDER BY year, month;

-- 2. Top 5 customers by revenue
SELECT customer_id, SUM(revenue) AS total_spent
FROM warehouse.fact_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- 3. Revenue by country
SELECT country, SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY country
ORDER BY total_revenue DESC;

-- 4. Payment method analysis
SELECT payment_type, COUNT(*) AS transactions, SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY payment_type;

-- 5. Discount impact analysis
SELECT discount, SUM(revenue) AS revenue
FROM warehouse.fact_sales
GROUP BY discount
ORDER BY discount;

-- 6. Running total revenue (window function)
SELECT
    order_date,
    SUM(revenue) OVER (ORDER BY order_date) AS running_revenue
FROM warehouse.fact_sales;

-- 7. Average order value
SELECT AVG(revenue) AS avg_order_value
FROM warehouse.fact_sales;

-- 8. Customer lifetime value (CLV)
SELECT
    customer_id,
    SUM(revenue) AS lifetime_value
FROM warehouse.fact_sales
GROUP BY customer_id
ORDER BY lifetime_value DESC;

-- 9. Top selling products
SELECT
    product_id,
    SUM(quantity) AS total_units_sold
FROM warehouse.fact_sales
GROUP BY product_id
ORDER BY total_units_sold DESC;

-- 10. Daily revenue variance
SELECT
    order_date,
    revenue - LAG(revenue) OVER (ORDER BY order_date) AS revenue_change
FROM warehouse.fact_sales;
