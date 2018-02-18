DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS breeds;
DROP TABLE IF EXISTS types;

CREATE TABLE types (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL
);

CREATE TABLE breeds (
  id SERIAL PRIMARY KEY,
  breed VARCHAR(255) NOT NULL,
  type INT REFERENCES types(id)
);

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  type INT REFERENCES types(id),
  breed INT REFERENCES breeds(id),
  gender VARCHAR(255),
  age INT,
  photo VARCHAR(255),
  healthy BOOLEAN,
  safe BOOLEAN,
  adopted BOOLEAN NOT NULL,
  admission_date DATE NOT NULL
);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  telephone INT NOT NULL,
  email VARCHAR(255),
  address VARCHAR(255),
  postcode VARCHAR(255),
  type_choice INT REFERENCES types(id),
  breed_choice INT REFERENCES breeds(id),
  seeks_pet BOOLEAN NOT NULL,
  registration_date DATE NOT NULL
);

CREATE TABLE adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id) NOT NULL,
  owner_id INT REFERENCES owners(id) NOT NULL,
  adoption_date DATE NOT NULL
);
