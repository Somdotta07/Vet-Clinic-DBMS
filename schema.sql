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
------------------------DAY 2----------------------------------


--Add a column species of type string to your animals 
ALTER TABLE animals ADD COLUMN species VARCHAR(250);



------------------------DAY 3----------------------------------
--Create a table named owners
CREATE TABLE owners(
   id SERIAL PRIMARY KEY,
   full_name VARCHAR(255),
   age INT
);
--Create a table named species
CREATE TABLE species(
   id SERIAL PRIMARY KEY,
   name VARCHAR(255)
   );


--Modify animals table:


--Make sure that id is set as autoincremented PRIMARY KEY- DONE

--Remove column species
ALTER TABLE animals DROP COLUMN species;
--Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD COLUMN species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);