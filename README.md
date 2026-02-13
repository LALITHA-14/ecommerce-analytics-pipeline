# 🛒 E-Commerce Analytics Data Pipeline

## 📌 Project Overview

This project implements a **production-style End-to-End E-Commerce Analytics Pipeline** that automates data generation, ingestion, validation, transformation, and analytics preparation using Python and PostgreSQL.

The pipeline simulates real-world ETL workflows used in modern data engineering systems and produces analytics-ready datasets for business intelligence dashboards.

---

## 🚀 Features

* Automated ETL Pipeline Orchestration
* Synthetic E-commerce Data Generation
* PostgreSQL Data Warehouse Integration
* Data Quality Validation Checks
* Business Rule Transformations
* Analytics Data Modeling
* Power BI Dashboard Integration
* Docker-based Environment Setup
* Execution Logging & Reporting

---

## 🏗️ Architecture Flow

```
Data Generation
        ↓
Data Ingestion (PostgreSQL)
        ↓
Data Validation
        ↓
Data Transformation
        ↓
Production Analytics Tables
        ↓
Power BI Dashboard
```

---

## 📂 Project Structure

```
ecommerce-analytics-pipeline/
│   .env.example
│   .gitignore
│   config.yaml
│   pytest.ini
│   README.md
│   requirements.txt
│   setup.sh
│   submission.md
│
├───.github
│   └───workflows
│           ci.yml
│
├───config
│       config.yaml
│
├───dashboards
│   ├───power_bi
│   │       ecommerce_analytics.pbix
│   │
│   └───screenshots
│       ├───power_bi
│       │       Page_1.png
│       │       Page_2.png
│       │       Page_3.png
│       │       Page_4.png
│       │
│       └───sql_queries
│               Average_order_value.png
│               Customer_lifetime_value.png
│               Daily_revenue_variance.png
│               Discount_impact_analysis.png
│               Monthly_revenue_trend.png
│               Payment_method_analysis.png
│               Revenue_by_country.png
│               Running_total_revenue.png
│               Top_5_customers_by_revenue.png
│               Top_selling_products.png
│
├───data
│   ├───analytics
│   │       etl_summary.json
│   │       monthly_revenue.csv
│   │       payment_split.csv
│   │
│   ├───processed
│   ├───raw
│   │       customers.csv
│   │       generation_metadata.json
│   │       products.csv
│   │       sales_data.csv
│   │       transactions.csv
│   │       transaction_items.csv
│   │
│   └───staging
├───docker
│       docker-compose.yml
│       Dockerfile
│       README.md
│
├───docs
│       api_documentation.md
│       architecture.md
│       assumptions.md
│       dashboard_guide.md
│       data_dictionary.md
│       methodology.md
│
├───logs
│       pipeline_execution_report.json
│
├───scripts
│   │   cleanup_old_data.py
│   │   pipeline_orchestrator.py
│   │   scheduler.py
│   │
│   ├───data_generation
│   │   │   generate_data.py
│   │   │
│   │   └───__pycache__
│   │           generate_data.cpython-314.pyc
│   │
│   ├───ingestion
│   │   │   ingest_to_postgres.py
│   │   │   ingest_to_staging.py
│   │   │
│   │   └───__pycache__
│   │           ingest_to_postgres.cpython-314.pyc
│   │
│   ├───monitoring
│   │       pipeline_metrics.py
│   │       pipeline_monitor.py
│   │
│   ├───quality_checks
│   │       validate_data.py
│   │
│   ├───transformation
│   │       generate_analytics.py
│   │       staging_to_production.py
│   │       transform_sql.py
│   │
│   └───validation
│           quality_checks.py
│           validation_checks.py
│
├───sql
│   │   aggregates.sql
│   │   analytics_queries.sql
│   │   analytics_views.sql
│   │   dimensions.sql
│   │   fact_sales.sql
│   │   schemas.sql
│   │   staging_validation.sql
│   │
│   ├───ddl
│   │       create_warehouse_schema.sql
│   │       warehouse_tables.sql
│   │
│   ├───dml
│   │       load_fact_and_dims.sql
│   │
│   └───queries
│           analytics_queries.sql
│           data_quality_checks.sql
│           monitoring_queries.sql
│
└───tests
        test_data_generation.py
        test_ingestion.py
        test_quality_checks.py
        test_transformation.py
```

---

## ⚙️ Setup Instructions

### 1️⃣ Clone Repository

```
git clone <repo_url>
cd ecommerce-analytics-pipeline
```

---

### 2️⃣ Install Dependencies

```
pip install -r requirements.txt
```

---

### 3️⃣ Configure Database

Update database credentials inside:

```
config/config.yaml
```

Example configuration:

```
database:
  host: localhost
  port: 5432
  user: postgres
  password: your_password
  dbname: ecommerce_dw
```

---

### 4️⃣ Run the Pipeline

```
python scripts/pipeline_orchestrator.py
```

---

## ✅ Pipeline Steps

| Step            | Description                          |
| --------------- | ------------------------------------ |
| Data Generation | Creates synthetic ecommerce datasets |
| Ingestion       | Loads data into PostgreSQL warehouse |
| Data Validation | Performs quality checks              |
| Transformation  | Applies cleansing and business rules |
| Production Load | Creates analytics-ready tables       |

---

## 📊 Outputs

* PostgreSQL Analytics Tables
* Execution Logs (`logs/pipeline_execution_report.json`)
* Analytical SQL Queries
* Power BI Dashboard

---

## 🧪 Testing

Run tests using:

```
pytest tests/
```

---

## 🐳 Docker Support

Start services using:

```
docker-compose up --build
```

---

## 📈 Dashboard

Power BI dashboard file available at:

```
dashboards/powerbi/ecommerce_analytics.pbix
```

---

## 🧠 Technologies Used

* Python
* PostgreSQL
* Pandas
* SQLAlchemy
* Psycopg2
* Docker
* Power BI

---

## 👩‍💻 Author

**Lalitha Pullela**

---

## ✅ Execution Status

The pipeline has been successfully tested with:

* ✔ Multiple successful executions
* ✔ Automated orchestration workflow
* ✔ Data validation checks passed
* ✔ Production data successfully loaded
* ✔ Reproducible setup using requirements file

This project demonstrates a complete real-world ETL and analytics workflow aligned with industry data engineering practices.
