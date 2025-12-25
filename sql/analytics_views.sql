-- MONTHLY REVENUE
CREATE OR REPLACE VIEW analytics.monthly_revenue AS
SELECT
    d.year,
    d.month,
    SUM(f.revenue) AS total_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_date d
    ON f.order_date = d.order_date
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

-- COUNTRY REVENUE
CREATE OR REPLACE VIEW analytics.country_revenue AS
SELECT
    c.country,
    SUM(f.revenue) AS total_revenue
FROM warehouse.fact_sales f
JOIN warehouse.dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.country
ORDER BY total_revenue DESC;

-- PAYMENT ANALYSIS
CREATE OR REPLACE VIEW analytics.payment_split AS
SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    SUM(revenue) AS total_revenue
FROM warehouse.fact_sales
GROUP BY payment_type
ORDER BY total_revenue DESC;
