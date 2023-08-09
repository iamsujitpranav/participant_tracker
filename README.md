# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Additional Questions

Provide sql for aggregate count of participants by year of birth.

SELECT EXTRACT(YEAR FROM date_of_birth) AS birth_year, COUNT(*) AS participant_count
FROM participants
GROUP BY EXTRACT(YEAR FROM date_of_birth)
ORDER BY birth_year;


Provide sql for aggregate count of participants by coordinator and gender.


SELECT c.name AS coordinator_name, p.gender, COUNT(*) AS participant_count
FROM participants p
JOIN coordinators c ON p.coordinator_id = c.id
GROUP BY c.name, p.gender;

Export participants for each coordinator in a csv format.

COPY (
  SELECT c.name AS coordinator_name, p.name AS participant_name, p.gender, p.date_of_birth
  FROM participants p
  JOIN coordinators c ON p.coordinator_id = c.id
  ORDER BY c.name, p.name
) TO '/path/to/exported_file.csv' CSV HEADER;
