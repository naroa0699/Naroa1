USE WORLD;
CREATE VIEW high_population_cities AS
SELECT name, countrycode,population
FROM CITY
WHERE POPULATION > 1000000;

CREATE VIEW countries_with_languages AS
SELECT c.name, cl.language
FROM country c
JOIN countrylanguage cl ON c.code = cl.countrycode
WHERE cl.language !='English';

-- Crear el usuario "db_user" y asignar privilegios
CREATE USER 'naroa_b'@'192.168.0.16' IDENTIFIED BY '1234';

-- Dar acceso de lectura en las tablas "city" y "country"
GRANT SELECT ON world.city TO 'naroa_b'@'192.168.0.16';
GRANT SELECT ON world.country TO 'naroa_b'@'192.168.0.16';

-- Dar acceso de escritura en la tabla "city"
GRANT INSERT, UPDATE ON world.city TO 'naroa_b'@'192.168.0.16';

-- Revocar la capacidad de modificar la tabla "country"
REVOKE INSERT, UPDATE, DELETE ON world.country FROM 'naroa_b'@'192.168.0.16';

-- Dar acceso completo a la vista "high_population_cities"
GRANT ALL PRIVILEGES ON high_population_cities TO 'naroa_b'@'192.168.0.16';
