import psycopg2

conn = psycopg2.connect(
    dbname="ecommerce",
    user="user",
    password="password",
    host="localhost"
)
cur = conn.cursor()

cur.execute("""
SELECT COUNT(*) 
FROM warehouse.fact_sales
WHERE customer_id IS NULL OR product_id IS NULL;
""")

issues = cur.fetchone()[0]
assert issues == 0, "Data quality check failed"

print("Data quality checks passed")
	