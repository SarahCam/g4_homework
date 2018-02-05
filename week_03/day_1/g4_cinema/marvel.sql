DROP TABLE attendances;
DROP TABLE movies;
DROP TABLE people;

CREATE TABLE movies (
	id SERIAL8 PRIMARY KEY,
	title VARCHAR(255),
	year INT2,
	show_time VARCHAR(255)
);

CREATE TABLE people (
	id SERIAL8 PRIMARY KEY,
	name VARCHAR(255)
);

CREATE TABLE attendances (
	id SERIAL8 PRIMARY KEY,
	person_id INT REFERENCES people(id) ON DELETE CASCADE,
	movie_id INT REFERENCES movies(id) ON DELETE CASCADE
);

INSERT INTO people (name) VALUES ('Graeme Brough');
INSERT INTO people (name) VALUES ('Victor Cintron');
INSERT INTO people (name) VALUES ('Eleftheria Koronidi');
INSERT INTO people (name) VALUES ('Edward Ostler');
INSERT INTO people (name) VALUES ('Paul Stewart');
INSERT INTO people (name) VALUES ('Sarah Campbell');
INSERT INTO people (name) VALUES ('Daniel Kelly');
INSERT INTO people (name) VALUES ('Jeff Bridges');
INSERT INTO people (name) VALUES ('Angus Malloch');
INSERT INTO people (name) VALUES ('Steven Ward');
INSERT INTO people (name) VALUES ('Daniel Conner');
INSERT INTO people (name) VALUES ('Jonathan Cruickshank');
INSERT INTO people (name) VALUES ('Emma Roberts');
INSERT INTO people (name) VALUES ('Elanor McCulloch');
INSERT INTO people (name) VALUES ('Chris Murphy');
INSERT INTO people (name) VALUES ('Deborah Gemmell');
INSERT INTO people (name) VALUES ('Gene BaMaung');
INSERT INTO people (name) VALUES ('Jim Bevington');
INSERT INTO people (name) VALUES ('Christine Lester');

INSERT INTO movies (title, year, show_time) VALUES ('Iron Man', 2008, '18:10');
INSERT INTO movies (title, year, show_time) VALUES ('The Incredible Hulk', 2008, '20:10');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 2', 2010, '19:05');
INSERT INTO movies (title, year, show_time) VALUES ('Thor', 2011, '21:45');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The First Avenger', 2011, '17:50');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers Assemble', 2012, '15:20');
INSERT INTO movies (title, year, show_time) VALUES ('Iron Man 3', 2013, '21:00');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: The Dark World', 2013, '19:35');
INSERT INTO movies (title, year, show_time) VALUES ('Batman Begins', 2005, '13:30');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: The Winter Soldier', 2014, '16:25');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy', 2014, '21:20');
INSERT INTO movies (title, year, show_time) VALUES ('Avengers: Age of Ultron', 2015, '21:00');
INSERT INTO movies (title, year, show_time) VALUES ('Ant-Man', 2015, '22:00');
INSERT INTO movies (title, year, show_time) VALUES ('Captain America: Civil War', 2016, '19:30');
INSERT INTO movies (title, year, show_time) VALUES ('Doctor Strange', 2016, '20:30');
INSERT INTO movies (title, year, show_time) VALUES ('Guardians of the Galaxy 2', 2017, '21:40');
INSERT INTO movies (title, year, show_time) VALUES ('Spider-man: Homecoming', 2017, '15:10');
INSERT INTO movies (title, year, show_time) VALUES ('Thor: Ragnarok', 2017, '14:30');

INSERT INTO attendances (person_id, movie_id) VALUES (15, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (14, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 16);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 17);
INSERT INTO attendances (person_id, movie_id) VALUES (11, 16);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 17);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (14, 5);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 11);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 18);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (8, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (13, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 17);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (2, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 10);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (5, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (3, 9);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 16);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 12);
INSERT INTO attendances (person_id, movie_id) VALUES (14, 17);
INSERT INTO attendances (person_id, movie_id) VALUES (1, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (16, 6);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 2);
INSERT INTO attendances (person_id, movie_id) VALUES (17, 16);
INSERT INTO attendances (person_id, movie_id) VALUES (18, 17);
INSERT INTO attendances (person_id, movie_id) VALUES (7, 8);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 14);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 15);
INSERT INTO attendances (person_id, movie_id) VALUES (10, 1);
INSERT INTO attendances (person_id, movie_id) VALUES (19, 4);
INSERT INTO attendances (person_id, movie_id) VALUES (9, 3);
INSERT INTO attendances (person_id, movie_id) VALUES (4, 13);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (12, 7);
INSERT INTO attendances (person_id, movie_id) VALUES (6, 1);