DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS screenings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  funds FLOAT
);

CREATE TABLE films (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  price FLOAT
);

CREATE TABLE screenings (
  id SERIAL PRIMARY KEY,
  start_time VARCHAR(255),
  end_time VARCHAR(255),
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  seats INT
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE,
  screening_id INT REFERENCES screenings(id) ON DELETE CASCADE
);
