/*1st Transaction UPDATE & ROLLBACK*/

--Inside a transaction update the animals table by setting the species column to unspecified. Verify that change was made.
--Then roll back the change and verify that species columns went back to the state before tranasction.
BEGIN;
UPDATE animals SET species='unspecified';
--UPDATE 10
ROLLBACK;
----------------------------------------------------------------------------------------------------------------------------
/* 2nd Transaction UPDATE & COMMIT */


--Inside a transaction:
-- 1.Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
--UPDATE 6
-- 2.Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species='pokemon' WHERE species is NULL;
--UPDATE 4
-- 3.Commit the transaction.
COMMIT
-- 4.Verify that change was made and persists after commit.
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |       8.0 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |      11.0 | digimon
  6 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |     -45.0 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |     -11.0 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |      17.0 | pokemon
(10 rows)*/
-------------------------------------------------------------------------------------------------------------------------
/*3rd Transaction DELETE & ROLLBACK*/


--Now, take a deep breath and... Inside a transaction delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
--(What have I done!!!!!!!!!!!!!!!!) DELETE 10
ROLLBACK;
--After the roll back verify if all records in the animals table still exist. After that you can start breath as usual ;)
--SAVED(YEAH!!!)
/*
 id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |       8.0 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |      11.0 | digimon
  6 | Plantmon   | 2022-11-15    |               2 | t        |      -5.7 | digimon
  8 | Angemon    | 2005-06-12    |               1 | t        |     -45.0 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
  5 | Charmander | 2020-02-08    |               0 | f        |     -11.0 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |    -12.13 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |      17.0 | pokemon
(10 rows)*/
---------------------------------------------------------------------------------------------------------------------------------------------
/*4th Transaction DELETE, SAVEPOINT,UPDATE,ROLLBACK,COMMIT*/


--Inside a transaction:
BEGIN;
--1.Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth >'2022-1-1';
--DELETE 1
--2.Create a savepoint for the transaction.
SAVEPOINT delete_data;
--3.Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg= -1*weight_kg;
--UPDATE 9
--4.Rollback to the savepoint
ROLLBACK TO delete_data;
--5.Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg= -1*weight_kg WHERE weight_kg < 0;
--UPDATE 3
/*
id |    name    | date_of_birth | escape_attempts | neutered | weight_kg | species
----+------------+---------------+-----------------+----------+-----------+---------
  1 | Agumon     | 2020-02-03    |               0 | t        |     10.23 | digimon
  2 | Gabumon    | 2018-11-15    |               2 | t        |       8.0 | digimon
  4 | Devimon    | 2017-05-12    |               5 | t        |      11.0 | digimon
  9 | Boarmon    | 2005-06-07    |               7 | t        |      20.4 | digimon
  3 | Pikachu    | 2021-01-07    |               1 | f        |     15.04 | pokemon
 10 | Blossom    | 1998-10-13    |               3 | t        |      17.0 | pokemon
  8 | Angemon    | 2005-06-12    |               1 | t        |      45.0 | digimon
  5 | Charmander | 2020-02-08    |               0 | f        |      11.0 | pokemon
  7 | Squirtle   | 1993-04-02    |               3 | f        |     12.13 | pokemon
(9 rows)*/
--6.Commit transaction
COMMIT;
--------------------------------------------------------------------------------------------------------