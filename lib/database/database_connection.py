import pandas as pd
from sqlalchemy import create_engine

def connect_to_database():
    db_connection_str = 'mysql+pymysql://root:Krimkodeks1_@localhost/weather_data'
    return create_engine(db_connection_str)

def fetch_weather_data():
    db_connection = connect_to_database()
    query = "select * from data"
    return pd.read_sql(query, db_connection)
