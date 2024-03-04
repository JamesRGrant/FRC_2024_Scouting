# FRC 2024 Scouting Database
Scripts to create the database for the system.

## Domain Details
The game has three main phases:
* Autonomous: the robot runs independently for 15s
* Teleoperated: the human players control the robot via joysticks
* End game: still teleoperated, but some additional scoring objectives

This app is designed to allow an observer to record the performance of a robot in this season's game.  Attributes that can be recorded are:

* Autonomous
    * Leave the start zone
    * Successful or failed attempts scoring in the AMP
    * Successful or failed attempts scoring in the SPEAKER
* Teleoperated
    * Successful or failed attempts scoring in the AMP
    * Successful or failed attempts scoring in the SPEAKER
    * Successful or failed attempts scoring in the SPEAKER while amplified
* End game
    * Parked in the end zone
    * Hanging (while ONSTAGE or not)
    * More than one robot on a chain
    * NOTE in one or more TRAPs

While each successful event results in points scored, the goal here is to record the successful attempts or unsuccessful attempts (final scores can always be calculated later).  
* If a robot has a high number of successful attempts, they would be a good alliance team member.  
* A robot that has unsuccessful attempts indicates it is inconsistent and not achieving its potential.  They may be a good alliance team member if they can resolve their issues.
* A robot with a low number of successful and few unsuccessful attempts indicates a robot that does not have good mechanisms to score at a high frequency.  They are unlikely to be a good team member.

## Local Setup
1. Ensure postgres is installed and running.
2. Switch to the postgres super user account (postgres is default)

    `su - postgres`

3. Run the init script.  This will create the database and system user.  Note that you have to specify the system user password (local dev password used here).

    `psql --set=pw="robots" -f init.sql`

4. Run the schema script 

    `psql -d frc2024 -f schema.sql`
    * Note that if you changed database name in init.sql, you should change the -d argument on this and future scripts.

5. Load test data via the data script. 

    `psql -d frc2024 -f test_data.sql`

To refresh your environment you can either:
1. Run the drop database script and then rerun the commands above

    `psql -f drop.sql`

2. Or, just run the batch file that runs all 4 of those commands

    Run this once on your account with admin escalation:
    `sudo chmod +x rebuild_all.sh`

    Run this as needed with your postgres admin user:
    `./rebuild_all.sh`
