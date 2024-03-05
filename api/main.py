from fastapi import FastAPI
import psycopg2
import os
from dotenv import load_dotenv
import json
from pathlib import Path

# Load environment variables
env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)
POSTGRES_USER : str = os.getenv("POSTGRES_USER")
POSTGRES_PASSWORD = os.getenv("POSTGRES_PASSWORD")
POSTGRES_SERVER : str = os.getenv("POSTGRES_SERVER","localhost")
POSTGRES_PORT : str = os.getenv("POSTGRES_PORT",5432) # default postgres port is 5432
POSTGRES_DB : str = os.getenv("POSTGRES_DB","tdd")
DATABASE_URL = f"postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_SERVER}:{POSTGRES_PORT}/{POSTGRES_DB}"


# Connect to the DB and start the API
conn = psycopg2.connect(DATABASE_URL)
conn.autocommit = True
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "FRC Scouting API for 2024 Season"}

@app.get("/match_team_actions/{match_team_action_id}")
async def read_item(item_id: int):
    c = conn.cursor()
    c.execute("SELECT * FROM match_team_action WHERE match_team_action_id = %s", (item_id,))
    rows = c.fetchall()

    # Convert the results to JSON
    json_data = []
    for row in rows:
        json_data.append(dict(zip([column[0] for column in c.description], row)))

    c.close()
    return json_data

@app.post("/match_team_actions/")
async def create_item(item: dict):
    sql = ("INSERT INTO public.match_team_action "
    "(event_code, match_code, team_number, "
    "auto_leave, auto_amp, auto_speaker, auto_amp_fail, auto_speaker_fail, "
    "tele_amp, tele_speaker, tele_speaker_amped, tele_amp_fail, tele_speaker_fail, tele_speaker_amped_fail, "
    "end_park, end_hang, end_hang_onstage, end_harmony, end_trap, end_hang_fail, end_trap_fail, "
    "robot_disabled) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
    c = conn.cursor()
    c.execute(sql, 
        (item["event_code"], item["match_code"], item["team_number"],
          item["auto_leave"], item["auto_amp"], item["auto_speaker"], item["auto_amp_fail"], item["auto_speaker_fail"], 
          item["tele_amp"], item["tele_speaker"], item["tele_speaker_amped"], item["tele_amp_fail"], item["tele_speaker_fail"], item["tele_speaker_amped_fail"], 
          item["end_park"], item["end_hang"], item["end_hang_onstage"], item["end_harmony"], item["end_trap"], item["end_hang_fail"], item["end_trap_fail"], 
          item["robot_disabled"] ))
    c.close()
    return {"message": "Item created successfully"}

@app.delete("/match_team_actions/{match_team_action_id}")
async def delete_item(item_id: int):
    c = conn.cursor()
    c.execute("DELETE FROM match_team_action WHERE match_team_action_id = %s", (item_id,))
    c.close()
    return {"message": "Item deleted successfully"}




# POST: to create data.
# GET: to read data.
# PUT: to update data.
# DELETE: to delete data.