use world;
SELECT name FROM country
WHERE population BETWEEN 50000000 AND 200000000;


SELECT name FROM country
WHERE population IN (SELECT population FROM country WHERE population BETWEEN 20000000 AND 50000000);

SELECT name FROM city
WHERE population BETWEEN 1000000 AND 10000000
AND countrycode NOT IN (SELECT code FROM country WHERE region = 'Asia');

SELECT name FROM country
WHERE population > 100000000 OR region = 'Europe';

SELECT name FROM city
WHERE name LIKE 'A%' AND name NOT LIKE '%n';
