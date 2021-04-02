# noinspection SqlNoDataSourceInspectionForFile

-- name	continent	area	population	gdp
-- Afghanistan	Asia	652230	25500100	20343000000
-- Albania	Europe	28748	2831741	12960000000
-- Algeria	Africa	2381741	37100000	188681000000
-- Andorra	Europe	468	78115	3712000000
-- Angola	Africa	1246700	20609294	100990000000
-- ...


-- List each country name where the population is larger than that of 'Russia'.

SELECT name
  FROM world
 WHERE population > (
      SELECT population FROM world
       WHERE name='russia'
)

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.


SELECT name
  FROM world
 WHERE continent = 'Europe'
   AND gdp / population > (
        SELECT gdp / population
          FROM world
         WHERE name = 'United Kingdom'
)

#  List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent
  FROM world
 WHERE continent IN
      (SELECT continent
         FROM world
        WHERE name IN ('Australia', 'Argentina'))
ORDER BY name ASC

# Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population
  FROM world
 WHERE population > (
      SELECT population
        FROM world
       WHERE name = 'Canada')
               AND population < (
            SELECT population
              FROM world
              WHERE name = 'Poland'
)
# Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT name,
       CONCAT( ROUND(100 * population /
                     (SELECT population
                        FROM world
                       WHERE name = 'Germany')), '%') AS percentage
  FROM world
 WHERE continent = 'Europe'

#  Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)


SELECT name
  FROM world
 WHERE gdp > ALL(SELECT gdp
                   FROM world
                  WHERE continent = 'Europe'
                    AND GDP > 1)
