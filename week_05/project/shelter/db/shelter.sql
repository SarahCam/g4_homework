DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS breeds;
DROP TABLE IF EXISTS species;

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE breeds (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  species_id INT REFERENCES species(id)
);

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  species_id INT REFERENCES species(id),
  breed_id INT REFERENCES breeds(id),
  gender VARCHAR(32),
  age INT,
  photo VARCHAR(255),
  healthy VARCHAR(32),  -- CHANGE TO BOOLEAN
  safe VARCHAR(32),  -- CHANGE TO BOOLEAN
  adopted VARCHAR(32) NOT NULL,  -- CHANGE TO BOOLEAN
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
  species_id INT REFERENCES species(id),
  breed_id INT REFERENCES breeds(id),
  seeks_pet BOOLEAN NOT NULL,
  registration_date DATE NOT NULL
);

CREATE TABLE adoptions (
  id SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id) NOT NULL,
  owner_id INT REFERENCES owners(id) NOT NULL,
  adoption_date DATE NOT NULL
);
