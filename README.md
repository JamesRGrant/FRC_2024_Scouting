# FRC_2024_Scouting
_This is a lab for MSOE course CSC 5201 Microservices and Cloud Computing._

First Robotics Competition is an annual, worldwide competition for high school students (https://www.firstinspires.org/robotics/frc).  Each year, the challenge is different.  One of the tasks is to scout other teams to determine what they are good at.  This data is useful in any competition finals because you have to select 2 alliance partners.

This system implements a web application (not complete in lab 8), API, and database to record and  report on scouting data. 

# Domain Details - FRC 2024 Crescendo
At an event, teams are randomly paired into an alliance of three teams for qualification matches.  Then, the top teams get to select 2 other teams for their alliance for the finals.

Metics from FRC and a companion website (https://www.thebluealliance.com/) produce overall team stats and match stats.  

What they do not produce is individual robot performance in a match.  So, an individual team/robot could have scored most or almost none of it's alliance points that match.  So, it is useful to track the actual performance of an individual robot.  That is what this system is designed to accomplish.

A 2.5 minute overview of the game in 2024 is here: https://www.youtube.com/watch?v=9keeDyFxzY4

The game manual is available here: https://firstfrc.blob.core.windows.net/frc2024/Manual/2024GameManual.pdf.  Of note, page 48 (this may vary as updates are published) contains a table of the scoring values.  This manual also contains definitions of terms used on this season's field, such as AMP, SPEAKER and NOTE.

See the `db` project for domain information on what is recorded.

The Blue Alliance will record overall game outcomes such as total points, coopertition points, and ranking points.  This may be displayed in the app at a later time via the Blue Alliance API.

# Database
_Lab 8 in the course demonstrates using a SQLLite database.  This is a database in a local file that will disappear when the container is destroyed.  Instead, we used a managed PostgresDB to ensure our data lives on._

The `db` subproject contains scripts to create the schema for the database.  At present, it only has a table to record new scouting records.

Other entities (such as event or team) are just strings (using the Blue Alliance conventions).

# API
The `api` subproject provides read and write endpoints.
