from fastapi import FastAPI
import psycopg2
import os
from dotenv import load_dotenv
import json

from pathlib import Path
env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)

POSTGRES_USER : str = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_SERVER : str = os.getenv("POSTGRES_SERVER","localhost")
POSTGRES_PORT : str = os.getenv("POSTGRES_PORT",5432) # default postgres port is 5432
POSTGRES_DB : str = os.getenv("POSTGRES_DB","tdd")
DATABASE_URL = f"postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_SERVER}:{POSTGRES_PORT}/{POSTGRES_DB}"
print(DATABASE_URL)

conn = psycopg2.connect(DATABASE_URL)
conn.autocommit = True
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/match_team_action/{match_team_action_id}")
async def read_item(item_id: int):
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM match_team_action WHERE match_team_action_id = %s", (item_id,))

    # Fetch the results
    rows = cursor.fetchall()

    # Convert the results to JSON
    json_data = []
    for row in rows:
        json_data.append(dict(zip([column[0] for column in cursor.description], row)))

    # data = cursor.fetchall() 
    # print(json.dumps(data)) 
    
    # return {"match_team_action_id": item_id}
    return json_data


# conn.autocommit = True
# cursor = conn.cursor() 
  
# sql = '''CREATE TABLE employees(emp_id int,emp_name varchar, \ 
# salary decimal); '''
  
# cursor.execute(sql) 
  
# conn.commit() 
# conn.close() 