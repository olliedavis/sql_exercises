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