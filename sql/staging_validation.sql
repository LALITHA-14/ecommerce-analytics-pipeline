-- Row count check
SELECT COUNT(*) FROM staging.sales_data;

-- Column check
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'staging'
  AND table_name = 'sales_data';
