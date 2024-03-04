-- Run this the first time to initialize the database
-- Requires you pass in the password: psql --set=pw="my_pass" -f init.sql
\set db frc2024
\set user scout
CREATE DATABASE :db;
COMMENT ON DATABASE :db IS 'FRC 2024 Scouting Application';
CREATE ROLE :user WITH LOGIN PASSWORD :'pw';
COMMENT ON ROLE :user IS 'User for API';
GRANT ALL PRIVILEGES ON DATABASE :db TO :user;
