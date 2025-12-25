

```markdown

\# submission.md



\# E-Commerce Data Pipeline - Submission



\## Submitted By

\*\*Name:\*\* Lalitha Pullela  

\*\*Project:\*\* E-Commerce Data Pipeline  

\*\*Date:\*\* 25-Dec-2025



---



\## Project Description

This project builds an end-to-end \*\*data engineering and analytics pipeline\*\* for e-commerce transactions:



\- Raw data generation and ingestion into PostgreSQL

\- ETL transformations to clean and aggregate data

\- Data quality validation

\- Analytical queries for business insights

\- Power BI dashboards for visualization



---



\## Folder Structure

data/

scripts/

sql/

dashboards/

docker/

config/

logs/

docs/

tests/





---



\## Key Files



| Folder | Important Files |

|--------|----------------|

| dashboards/powerbi | ecommerce\_analytics.pbix |

| dashboards/screenshots/sql\_queries | SQL query outputs screenshots |

| dashboards/screenshots/powerbi | Dashboard visuals screenshots |

| data/raw | Raw CSV files |

| data/processed | Cleaned/aggregated CSV files |

| scripts | ETL, ingestion, transformation, quality checks |

| sql/ddl | Table creation scripts |

| sql/dml | Data insertion scripts |

| sql/queries | Analytical SQL queries |

| docs | Architecture, methodology, assumptions, data dictionary |

| docker | Docker configuration files |



---



\## How to Run



1\. Install dependencies:



```bash

pip install -r requirements.txt





Setup environment variables from .env.example.



Run the orchestrator:



python scripts/pipeline\_orchestrator.py





This will execute the full pipeline: generate data → ingest → transform → analytics → dashboards.



Screenshots



All screenshots are included in dashboards/screenshots/:



SQL queries: dashboards/screenshots/sql\_queries/



Power BI dashboards: dashboards/screenshots/powerbi/



Notes



All scripts are tested; logs are stored in logs/



Docker setup is available for containerized execution



The pipeline includes automated ETL, transformation, validation, and analytics

