                movie
id	title	yr	director	budget	gross
                actor
              id	name
                casting
         movieid  actorid	ord
# 1.
# List the films where the yr is 1962 [Show id, title]

SELECT id, title
  FROM movie
 WHERE yr=1962

# 2.
# Give year of 'Citizen Kane'.

SELECT yr
  FROM movie
 WHERE title = 'Citizen Kane'

# 3.
# List all of the Star Trek movies, include the id, title and yr. Order results by year.

  SELECT id, title, yr
    FROM movie
   WHERE title LIKE 'Star Trek%'
ORDER BY yr ASC

# 4.
# What id number does the actor 'Glenn Close' have?

SELECT id
  FROM actor
 WHERE name = 'Glenn Close'

# 5.
# What is the id of the film 'Casablanca'

 SELECT id
  FROM movie
 WHERE title = 'Casablanca'

# 6.
# Obtain the cast list for 'Casablanca'

SELECT name
  FROM actor
      JOIN casting ON id = actorID
      WHERE movieid = 11768

# 7.
# Obtain the cast list for the film 'Alien'
SELECT name
  FROM actor
        JOIN casting ON actor.id = actorID
        JOIN movie ON movieid = movie.id
       WHERE title = 'Alien'