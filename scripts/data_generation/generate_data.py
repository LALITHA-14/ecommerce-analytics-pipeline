import pandas as pd
import yaml
import os
import random
from datetime import datetime, timedelta

with open("config/config.yaml") as f:
    config = yaml.safe_load(f)

GEN_CFG = config["data_generation"]
RAW_PATH = config["paths"]["raw_data"]

os.makedirs(RAW_PATH, exist_ok=True)


def generate_customers(n):
    return pd.DataFrame({
        "customer_id": range(1, n + 1),
        "country": [random.choice(["India", "USA", "UK"]) for _ in range(n)]
    })


def generate_products(n):
    return pd.DataFrame({
        "product_id": range(1, n + 1),
        "price": [random.randint(10, 500) for _ in range(n)]
    })


def generate_sales(n):
    start = datetime.strptime(GEN_CFG["start_date"], "%Y-%m-%d")
    end = datetime.strptime(GEN_CFG["end_date"], "%Y-%m-%d")

    dates = [
        start + timedelta(days=random.randint(0, (end - start).days))
        for _ in range(n)
    ]

    return pd.DataFrame({
        "sale_id": range(1, n + 1),
        "customer_id": [random.randint(1, GEN_CFG["customers"]) for _ in range(n)],
        "product_id": [random.randint(1, GEN_CFG["products"]) for _ in range(n)],
        "amount": [random.randint(50, 1000) for _ in range(n)],
        "sale_date": dates
    })


def main():
    generate_customers(GEN_CFG["customers"]).to_csv(
        f"{RAW_PATH}/customers.csv", index=False
    )

    generate_products(GEN_CFG["products"]).to_csv(
        f"{RAW_PATH}/products.csv", index=False
    )

    generate_sales(GEN_CFG["transactions"]).to_csv(
        f"{RAW_PATH}/sales_data.csv", index=False
    )

    print("Data Generation completed successfully.")


if __name__ == "__main__":
    main()
