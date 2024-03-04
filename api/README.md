# FRC 2024 Scouting API
API for the scouting API (Python FastAPI)

# How to run
For Linux/WSL:
* Create a .venv
* Install Fast API
* Install a PSQL library (using the binary to avoid build dependencies)
```
python3 -m venv .venv
source .venv/bin/activate

pip install "fastapi[all]"
pip install psycopg2-binary
pip instal python-dotenv

-- or

pip install -r requirements.txt
```
Run a web server to host the API

`uvicorn main:app --reload`

View in a web browser:  http://127.0.0.1:8000/ (JSON message "Hello World!")

See the Swagger docs: http://127.0.0.1:8000/docs


