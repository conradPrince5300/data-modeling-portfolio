import psycopg2
from config import DB_CONFIG

def execute_sql(file_path):
    with open(file_path, 'r') as file:
        query = file.read()
    with psycopg2.connect(**DB_CONFIG) as conn:
        with conn.cursor() as cur:
            cur.execute(query)
        conn.commit()

if __name__ == "__main__":
    print("Creating OLTP schema...")
    execute_sql("sql/create_oltp_schema.sql")

    print("Creating OLAP schema...")
    execute_sql("sql/create_olap_schema.sql")

    print("Loading OLTP data and transforming to OLAP...")
    execute_sql("sql/transformations.sql")

    print("OLAP schema successfully populated.")
