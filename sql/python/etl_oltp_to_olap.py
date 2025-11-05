import psycopg2
from config import DB_CONFIG

def execute_sql_file(filename):
    """Execute an SQL file."""
    with open(filename, 'r') as file:
        sql = file.read()
    with psycopg2.connect(**DB_CONFIG) as conn:
        with conn.cursor() as cursor:
            cursor.execute(sql)
            conn.commit()
    print(f"Executed: {filename}")

def main():
    """Run the ETL pipeline."""
    print("Starting OLTP → OLAP data pipeline...")
    
    try:
        # Step 1: Create OLTP schema
        execute_sql_file('sql/create_oltp_schema.sql')
        
        # Step 2: Create OLAP schema
        execute_sql_file('sql/create_olap_schema.sql')
        
        # Step 3: Run transformations
        execute_sql_file('sql/transformations.sql')
        
        print("ETL pipeline completed successfully!")
    
    except Exception as e:
        print(f"Error during ETL execution: {e}")

if __name__ == "__main__":
    main()
