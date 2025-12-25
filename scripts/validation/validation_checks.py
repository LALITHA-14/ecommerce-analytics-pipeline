from sqlalchemy import create_engine, text

engine = create_engine(
    "postgresql+psycopg2://postgres:Lalitha%401408@localhost:5432/ecommerce_dw"
)

def run_validation_checks():
    checks = {
        "staging_count": "SELECT COUNT(*) FROM staging.sales_data;",
        "fact_count": "SELECT COUNT(*) FROM warehouse.fact_sales;",
        "null_customers": """
            SELECT COUNT(*) FROM warehouse.fact_sales
            WHERE customer_id IS NULL;
        """,
        "null_products": """
            SELECT COUNT(*) FROM warehouse.fact_sales
            WHERE product_id IS NULL;
        """,
        "null_dates": """
            SELECT COUNT(*) FROM warehouse.fact_sales
            WHERE order_date IS NULL;
        """
    }

    with engine.connect() as conn:
        for name, query in checks.items():
            result = conn.execute(text(query)).scalar()
            print(f"{name}: {result}")

    print("✅ Data validation checks completed successfully")

if __name__ == "__main__":
    run_validation_checks()
