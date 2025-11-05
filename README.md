# Data Modeling Portfolio Project

This project demonstrates a complete **OLTP → OLAP** data modeling transformation using SQL and Python.  
It simulates a retail sales system, building both a transactional database and a dimensional warehouse optimized for analytics.

## 🔧 Tech Stack
- PostgreSQL
- Python (psycopg2)
- SQL (DDL, DML, transformations)
- dbdiagram.io (ER Diagrams)

## 🧱 Architecture
1. OLTP schema simulates transactional data.
2. ETL scripts clean and load data into an OLAP (Star Schema) structure.
3. Data is analyzed and visualized using Power BI or Tableau.

## 🗃️ Folder Structure
See project structure above.

## 📊 ER Diagrams
Add images in `diagrams/oltp_er_diagram.png` and `diagrams/olap_star_schema.png`

## 🚀 How to Run
1. Create a PostgreSQL database.
2. Update credentials in `config.py`.
3. Run `python etl_oltp_to_olap.py`.
4. Inspect tables or connect with Power BI.

## 💡 Key Concepts
- OLTP normalization
- OLAP dimensional modeling
- Data transformation using SQL
- ETL orchestration with Python

## 🧑‍💻 Author
**Conrad Omadi**  
Data Modeler | Solution Architect | Snowflake | Power BI | Data Governance


## 📊 ER Diagrams Explained

### 🧩 OLTP ER Diagram
Represents the source transactional system optimized for fast inserts and updates.

### 📈 OLAP Star Schema
Transforms OLTP data into a star schema for analytics and BI reporting.
