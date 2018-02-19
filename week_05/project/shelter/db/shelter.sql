DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS breeds;
DROP TABLE IF EXISTS species;

DELETE FROM pg_enum;  -- A little dangerous as this will delete everything!
DELETE FROM pg_type WHERE typname = 'gender_type';
DELETE FROM pg_type WHERE typname = 'answer_type';
DELETE FROM pg_type WHERE typname = 'species_type';

CREATE TYPE gender_type AS ENUM (
  'Male',
  'Female',
  'Unknown'
);

CREATE TYPE answer_type AS ENUM (
  'Yes',
  'No',
  'Check'
);

CREATE TYPE species_type AS ENUM (
  'Dog',
  'Cat',
  'Rabbit',
  'Horse',
  'Bird',
  'Snake'
);

CREATE TABLE species (
  id              SERIAL PRIMARY KEY,
  name            VARCHAR(255) NOT NULL
);

CREATE TABLE breeds (
  id              SERIAL PRIMARY KEY,
  name            VARCHAR(255) NOT NULL,
  species_id      INT REFERENCES species(id)
);

CREATE TABLE animals (
  id              SERIAL PRIMARY KEY,
  name            VARCHAR(255),
  species         species_type,
  breed           VARCHAR(255),
  gender          gender_type,
  age             INT,
  photo           VARCHAR(255),
  healthy         answer_type NOT NULL,
  safe            answer_type NOT NULL,
  adopted         BOOLEAN NOT NULL,
  admission_date  DATE NOT NULL
);

CREATE TABLE owners (
  id              SERIAL PRIMARY KEY,
  first_name      VARCHAR(255) NOT NULL,
  last_name       VARCHAR(255) NOT NULL,
  telephone       VARCHAR(255) NOT NULL,
  email           VARCHAR(255),
  address         VARCHAR(255),
  postcode        VARCHAR(255),
  species         species_type,
  breed           VARCHAR(255),
  seeks_pet       BOOLEAN NOT NULL,
  registration_date DATE NOT NULL
);

CREATE TABLE adoptions (
  id              SERIAL PRIMARY KEY,
  animal_id       INT REFERENCES animals(id) NOT NULL,
  owner_id        INT REFERENCES owners(id) NOT NULL,
  adoption_date   DATE NOT NULL
);
