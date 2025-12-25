# README.md

# E-Commerce Data Pipeline

## Project Overview
This project implements an end-to-end **E-Commerce Analytics Pipeline**, including:

- Data generation, ingestion, and ETL transformations
- Data quality validation
- Analytical SQL queries
- Power BI dashboards for visualization

The pipeline processes raw e-commerce transaction data and generates actionable insights for business intelligence.

---

## Folder Structure
data/ # Raw, staging, processed datasets
scripts/ # ETL, ingestion, transformation, quality check scripts
sql/ # DDL, DML, and analytical queries
dashboards/ # Power BI files and screenshots
docker/ # Docker configuration
config/ # Pipeline and database configurations
logs/ # Logs from pipeline runs
docs/ # Documentation: architecture, dashboards, methodology
tests/ # Unit and quality tests


---

## Setup Instructions

1. Clone the repository:

```bash
git clone <repo_url>
cd ecommerce-data-pipeline


Install dependencies:

pip install -r requirements.txt


Configure environment variables:

cp .env.example .env


Update .env with your PostgreSQL credentials.

Run the pipeline:

python scripts/pipeline_orchestrator.py


This will generate analytics datasets and populate the PostgreSQL database.

Key Components
Data

data/raw/ → Original CSV files

data/staging/ → Intermediate tables

data/processed/ → Cleaned and aggregated analytics files

Scripts

scripts/data_generation/ → Generate raw data

scripts/ingestion/ → Load data into PostgreSQL

scripts/transformation/ → Transform staging → analytics

scripts/quality_checks/ → Validation and quality checks

scripts/pipeline_orchestrator.py → Runs full ETL pipeline

SQL

sql/ddl/warehouse_tables.sql → Table creation

sql/dml/load_fact_and_dims.sql → Insert/update data

sql/queries/analytics_queries.sql → 10 analytical queries (Monthly revenue, top products, revenue by country, customer lifetime value, etc.)

Dashboards

Power BI dashboard: dashboards/powerbi/ecommerce_analytics.pbix

Screenshots:

SQL queries: dashboards/screenshots/sql_queries/

Dashboard visuals: dashboards/screenshots/powerbi/

Docker

docker/Dockerfile → Container configuration

docker/docker-compose.yml → Launch Postgres + app

Documentation

docs/architecture.md → Pipeline architecture diagram

docs/dashboard_guide.md → Dashboard instructions

docs/api_documentation.md → Script/API reference

docs/data_dictionary.md → Dataset column definitions

docs/assumptions.md → ETL & analysis assumptions

docs/methodology.md → Step-by-step methodology

Testing

Run tests to ensure pipeline integrity:

pytest tests/