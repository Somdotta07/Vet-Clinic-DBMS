/* Populate database with sample data. */

--Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Agumon','2020-2-3',0,true,10.23);

--Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Gabumon','2018-11-15',2,true,8.0);

--Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Pikachu','2021-1-7',1,false,15.04);

--Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Devimon','2017-5-12',5,true,11.0);


/*Day 2 Entry*/

--Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Charmander','2020-2-08',0,false,-11.0);
--Animal: Her name is Plantmon. She was born on Nov 15th, 2022, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Plantmon','2022-11-15',2,true,-5.7);
--Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to 3 times.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Squirtle','1993-04-02',3,false,-12.13);
--Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once.
 INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Angemon','2005-06-12',1,true,-45.0);
 --Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times.
 INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Boarmon','2005-06-07',7,true,20.4);
 --Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times.
INSERT INTO animals(NAME,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,NEUTERED,WEIGHT_KG) VALUES ('Blossom','1998-10-13',3,true,17.0);

/*Day 3 Entry*/
--Insert the following data into the owners table

--Sam Smith 34 years old.
--Jennifer Orwell 19 years old.
--Bob 45 years old.
--Melody Pond 77 years old.
--Dean Winchester 14 years old.
--Jodie Whittaker 38 years old.
INSERT INTO owners(FULL_NAME,AGE) VALUES('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);
--Insert the following data into the species table:
--Pokemon
--Digimon
INSERT INTO species (name) VALUES ('Pokemon'), ('Digimon');

--Modify your inserted animals so it includes the species_id value:
--If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
--All other animals are Pokemon
UPDATE animals SET species_id=1;

--Modify your inserted animals to include owner information (owner_id):
--Sam Smith owns Agumon.
UPDATE animals SET owner_id=1 WHERE name='Agumon';
--Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id=2 WHERE name IN ('Gabumon','Pikachu');
--Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id=3 WHERE name IN ('Devimon','Plantmon');
--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id=4 WHERE name IN ('Charmander','Squirtle','Blossom');
--Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id=5 WHERE name IN ('Angemon','Boarmon');
