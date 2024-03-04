#!/bin/bash 

# This script destorys and rebuilds the datbase
psql -f drop.sql
psql --set=pw="robots" -f init.sql
psql -d frc2024 -f schema.sql
psql -d frc2024 -f test_data.sql
psql -d frc2024 -c "SELECT * FROM public.match_team_action LIMIT 10";