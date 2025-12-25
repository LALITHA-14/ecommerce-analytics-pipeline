import psycopg2

conn = psycopg2.connect(
    dbname="ecommerce",
    user="user",
    password="password",
    host="localhost"
)
cur = conn.cursor()

with open("sql/ddl/warehouse_tables.sql", "r") as f:
    cur.execute(f.read())

conn.commit()
cur.close()
conn.close()

print("Warehouse transformation completed")
