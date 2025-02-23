use world;
SELECT name, population
FROM city
ORDER BY population DESC
LIMIT 10;

EXPLAIN SELECT name, population FROM city ORDER BY population DESC LIMIT 10;

CREATE INDEX idx_city_population ON city(population);

SELECT name, population
FROM city
WHERE population > 1000000 AND name LIKE 'A%';

