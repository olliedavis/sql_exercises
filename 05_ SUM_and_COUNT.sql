-- World Country Profile: Aggregate functions

-- name	continent	area	population	gdp
-- Afghanistan	Asia	652230	25500100	20343000000
-- Albania	Europe	28748	2831741	12960000000
-- Algeria	Africa	2381741	37100000	188681000000
-- Andorra	Europe	468	78115	3712000000
-- Angola	Africa	1246700	20609294	100990000000
-- ...

-- Show the total population of the world.

SELECT SUM(population)
  FROM world

-- List all the continents - just once each.

SELECT DISTINCT continent
  FROM world

-- Give the total GDP of Africa

SELECT SUM(gdp)
  FROM world
 WHERE continent = 'Africa'


-- How many countries have an area of at least 1000000

SELECT COUNT (name) AS Count
  FROM world
 WHERE area >= 1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
  FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- Using GROUP BY and HAVING

-- For each continent show the continent and number of countries.

   SELECT continent, COUNT(name)
     FROM world
 GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.

  SELECT continent, COUNT(name)
    FROM world
   WHERE population >= 10000000
GROUP BY continent

-- List the continents that have a total population of at least 100 million.

  SELECT continent
    FROM world
GROUP BY continent
  HAVING SUM(population) >= 100000000
