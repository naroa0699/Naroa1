SELECT Name, Language FROM countrylanguage;
SELECT Name, Population FROM city WHERE CountryCode = 'DEU';
SELECT Name, SurfaceArea FROM country ORDER BY SurfaceArea ASC LIMIT 5;
SELECT Name, Population FROM country WHERE Population > 50000000 ORDER BY Population DESC;
SELECT Continent, AVG(LifeExpectancy) FROM country GROUP BY Continent;
SELECT Region, SUM(Population) FROM country GROUP BY Region;
SELECT CountryCode, COUNT(*) AS CityCount FROM city GROUP BY CountryCode ORDER BY CityCount DESC;
SELECT city.Name, city.Population, country.Name AS CountryName
FROM city
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC LIMIT 10;
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French';
SELECT DISTINCT country.Name
FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English'
AND countrylanguage.IsOfficial = 'F';
-- Example placeholder (requires historical data)
SELECT Name FROM country WHERE Population / PreviousPopulation > 3;
SELECT Continent, MAX(GNP) AS Richest, MIN(GNP) AS Poorest
FROM country
GROUP BY Continent;
SELECT Name FROM country WHERE LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);
SELECT country.Capital, country.Name
FROM country WHERE country.Population > 100000000;
SELECT Continent, COUNT(*) AS CountryCount
FROM country
GROUP BY Continent
ORDER BY CountryCount DESC LIMIT 1;

