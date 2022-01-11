/*Queries that provide answers to the questions from all projects.*/

--Find all animals whose name ends in "mon".
SELECT * FROM animals WHERE name LIKE '%mon';
/*
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |       8.0
  4 | Devimon | 2017-05-12    |               5 | t        |      11.0
(3 rows)
*/
--List the name of all animals born between 2016 and 2019.
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-1-1';
/*name
---------
 Gabumon
 Devimon
(2 rows)*/

--List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered=true AND escape_attempts<3;
  /*name
---------
 Agumon
 Gabumon
(2 rows)*/

--List date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
/*
 date_of_birth
---------------
 2020-02-03
 2021-01-07
(2 rows)
*/
--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name,escape_attempts FROM animals WHERE weight_kg>10.5;
/*  name   | escape_attempts
---------+-----------------
 Pikachu |               1
 Devimon |               5
(2 rows)*/
--Find all animals that are neutered.
SELECT * FROM animals WHERE neutered=true;
/*
id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  2 | Gabumon | 2018-11-15    |               2 | t        |       8.0
  4 | Devimon | 2017-05-12    |               5 | t        |      11.0
(3 rows)*/
--Find all animals not named Gabumon.
 SELECT * FROM animals WHERE NOT name ='Gabumon';
/*
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  1 | Agumon  | 2020-02-03    |               0 | t        |     10.23
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Devimon | 2017-05-12    |               5 | t        |      11.0
(3 rows)*/
--Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;
/*
 id |  name   | date_of_birth | escape_attempts | neutered | weight_kg
----+---------+---------------+-----------------+----------+-----------
  3 | Pikachu | 2021-01-07    |               1 | f        |     15.04
  4 | Devimon | 2017-05-12    |               5 | t        |      11.0
(2 rows)
*/

                                  -----DAY 2-----
---Write queries to answer the following questions:
--How many animals are there?
 SELECT COUNT(*) FROM animals;
 /*count
-------
     9
*/
--How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
/*
 count
-------
     2
*/
--What is the average weight of animals?
SELECT ROUND(AVG(weight_kg)) FROM animals;
/*
round
-------
    17 
*/
--Who escapes the most, neutered or not neutered animals?
SELECT name, escape_attempts FROM animals WHERE escape_attempts =(SELECT MAX(escape_attempts) FROM animals);
/*
name   | escape_attempts
---------+-----------------
 Boarmon |               7
(1 row)
*/
--What is the minimum and maximum weight of each type of animal?
--For 'mon'----
SELECT MAX(weight_kg), MIN(weight_kg) FROM animals WHERE species LIKE '%mon%';
 /*max  | min
------+-----
 45.0 | 8.0
(1 row)*/
--For All species --
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
/*  species | min  | max
---------+------+------
 pokemon | 11.0 | 17.0
 digimon |  8.0 | 45.0
 */
--What is the average number of escape attempts per animal type of those born --between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-1-1' AND '2000-1-1' GROUP BY species;
/*
 species |        avg
---------+--------------------
 pokemon | 3.0000000000000000
*/

-------------------------------------------------------------------------------------------