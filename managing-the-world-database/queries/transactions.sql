use world;
START TRANSACTION;
INSERT INTO city (name, countrycode, population) VALUES ('New City', 'USA', 500000);
ROLLBACK;

START TRANSACTION;
INSERT INTO city (name, countrycode, population) VALUES ('Another City', 'USA', 200000);
UPDATE country SET population = population + 200000 WHERE code = 'USA';
COMMIT;
ROLLBACK;

START TRANSACTION;
SAVEPOINT before_insert;
INSERT INTO city (name, countrycode, population) VALUES ('Error City', 'USA', 0);
ROLLBACK TO before_insert;  -- Revertir solo la inserción
COMMIT;