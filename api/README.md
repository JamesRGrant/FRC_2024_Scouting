# FRC 2024 Scouting API
API for the scouting API (Python FastAPI)

# How to run locally
For Linux/WSL:
* Create a .venv
* Install Fast API
* Install a PSQL library (using the binary to avoid build dependencies)
* Install a library to manage environmental variables.
```
python3 -m venv .venv
source .venv/bin/activate

pip install "fastapi[all]"
pip install psycopg2-binary
pip instal python-dotenv

-- or

pip install -r requirements.txt
```
Create a `.env` file with your local database credentials, for example:

```
POSTGRES_USER=scout
POSTGRES_PASSWORD=robots
POSTGRES_SERVER=localhost
POSTGRES_PORT=5432
POSTGRES_DB=frc2024
```

Run a web server to host the API

`uvicorn main:app --reload`

View in a web browser:  http://127.0.0.1:8000/ (JSON message "FRC Scouting API for 2024 Season")

See the Swagger docs: http://127.0.0.1:8000/docs


# API Concepts
See the swagger documentation for the most up-to-date API details.

We use the standard REST API "verbs" to call the API:
* POST: to create data.
* GET: to read data.
* PUT: to update data.
* DELETE: to delete data.

## match_team_actions
This is a log of how a team did in a given match.  Actions performed (like scoring points or attempting & failing) are recorded as integers.  Actual point values can be looked up or implemented later.
* GET: get by ID
* POST: create a record
* DELETE: delete by ID

## event_team
Returns the performance of a team at entire event.  The actions for each match are averaged.  For example, for the task `auto_speaker`, if there were three records with values 0, 1, and 2, it would return the average of 1.
* POST: gets the averages by submitting the event and team

NOTE: a post is used because swagger doesn't like submitting BODYs on GET

# Build the Container
In the api directory (MAKE SURE YOU USE YOUR ID, NOT MINE!):

`docker build -t jamesrossgrant/frc2024api .`

Test locally (note the use of `host.docker.internal` to get to a local Postgres instance): 
```
docker run -p 8000:8000 -p 5432:5432 \
-e POSTGRES_USER='scout' \
-e POSTGRES_PASSWORD='robots' \
-e POSTGRES_SERVER='host.docker.internal' \
-e POSTGRES_PORT='5432' \
-e POSTGRES_DB='frc2024' \
jamesrossgrant/frc2024api
```

Hit the endpoint: http://localhost:8000/

OK, push it to docker hub!

`docker push jamesrossgrant/frc2024api`