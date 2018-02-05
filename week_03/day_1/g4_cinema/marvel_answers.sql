SELECT * FROM movies;

SELECT name FROM people;

UPDATE people
  SET name = 'Jean BaMaung'
  WHERE name = 'Gene BaMaung';

SELECT name FROM people;

SELECT name FROM people
  WHERE name = 'Sarah Campbell';

SELECT * FROM movies;

DELETE FROM movies
  WHERE title = 'Batman Begins';

SELECT * FROM movies;

SELECT * FROM people;

INSERT INTO people (name)
  VALUES ('Alan Russell');

SELECT * FROM people;

DELETE FROM people
  WHERE name = 'Jeff Bridges';

SELECT * FROM people;

SELECT * FROM movies;

INSERT INTO movies (title, year, show_time)
  VALUES ('Avengers: Infinity War', 2018, '00:00');

SELECT * FROM movies;

UPDATE movies
  SET show_time = '20:00'
  WHERE title = 'Guardians of the Galaxy';

SELECT * FROM movies;

-- DELETE FROM movies
--   WHERE title LIKE 'Guardian%';
--
-- DELETE FROM movies
--   WHERE title LIKE '%Man%';

DELETE FROM movies
  WHERE year > 2016;

DELETE FROM movies
  WHERE year BETWEEN 2008 AND 2011;

SELECT * FROM movies;
