/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;
CREATE TABLE animals (
   id SERIAL PRIMARY KEY,
   name VARCHAR(255),
   date_of_birth DATE,
   escape_attempts INT,
   neutered BOOLEAN,
   weight_kg DECIMAL );
);

--Add a column species of type string to your animals 
ALTER TABLE animals ADD COLUMN species VARCHAR(250);
