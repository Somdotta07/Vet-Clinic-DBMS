/*Queries that provide answers to the questions from all projects.*/
                                            -----DAY 1-----
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

                                              -----DAY 3-----

--Write queries (using JOIN) to answer the following questions:
--What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE full_name='Melody Pond';
 /* name
------------
 Blossom
 Charmander
 Squirtle
(3 rows)*/
--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;
/*
    name
------------
 Pikachu
 Blossom
 Charmander
 Squirtle
(4 rows)
*/
--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name,full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;
/*
    name    |    full_name
------------+-----------------
 Agumon     | Sam Smith
 Gabumon    | Jennifer Orwell
 Pikachu    | Jennifer Orwell
 Devimon    | Bob
 Squirtle   | Melody Pond
 Charmander | Melody Pond
 Blossom    | Melody Pond
 Angemon    | Dean Winchester
 Boarmon    | Dean Winchester
            | Jodie Whittaker
*/
--How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id=species.id GROUP BY species.name;
/*
 name   | count
---------+-------
 Pokemon |     4
 Digimon |     5
(2 rows)
*/
--List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id WHERE owners.full_name='Jennifer Orwell' AND species_id=2;
/*
  name
---------
 Gabumon
(1 row)
*/
--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals JOIN owners ON animals.owner_id=owners.id 
WHERE owners.full_name='Dean Winchester' AND escape_attempts=0;
/*
 name
------
(0 rows)
*/
--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;
/*
  full_name  | total
-------------+-------
 Melody Pond |     3
(1 row)
*/  
--------------------------------------------------------------------------------------------------------------------------------

                                           -----DAY 4-----

--Write queries to answer the following:

--Who was the last animal seen by William Tatcher?
SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;
--How many different animals did Stephanie Mendez see?
SELECT COUNT(*) as total_animals from vets JOIN visits ON vets.id = visits.vets_id WHERE name='Stephanie Mendez';
--List all vets and their specialties, including vets with no specialties.
SELECT 
	vets.name,
	species.name as specialization
from vets
LEFT JOIN specializations ON specializations.vets_id = vets.id
LEFT JOIN  species ON specializations.species_id = species.id;
--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name ,date_of_visit from animals JOIN visits ON animals.id= visits.animals_id JOIN vets ON vets.id=visits.vets_id WHERE vets.name= 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
--What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as total_visit from animals
JOIN visits ON visits.animals_id = animals.id
GROUP BY animals.name
ORDER BY total_visit DESC
LIMIT 1;
--Who was Maisy Smith's first visit?
SELECT vets.name, animals.name, date_of_visit FROM vets JOIN visits ON vets.id=visits.vets_id
JOIN animals ON animals.id= visits.animals_id WHERE vets.name ='Maisy Smith' ORDER BY visits.date_of_visit ASC LIMIT 1;
--Details for most recent visit: animal information, vet information, and date of visit.
SELECT
	date_of_visit,
	animals.date_of_birth as animal_dob,
	animals.escape_attempts,
	animals.neutered,
	animals.weight_kg as animal_weight,
	vets.name as vet_name,
	vets.age as vet_age,
	vets.date_of_graduation
from visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
ORDER BY date_of_visit
LIMIT 1;
--How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*)
FROM visits
JOIN animals ON animals.id = visits.animals_id
JOIN vets ON vets.id = visits.vets_id
JOIN specializations ON specializations.vets_id = visits.vets_id
WHERE animals.species_id != specializations.species_id;
--What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name as specialization , COUNT(visits.animals_id) from visits
JOIN vets ON vets.id = visits.vets_id
JOIN animals ON animals.id = visits.animals_id
JOIN species ON species.id = animals.species_id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;                                         