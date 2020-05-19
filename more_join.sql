--List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962

 --When was Citizen Kane released?
 SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

--List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id, title, yr
FROM movie
WHERE title LIKE  '%Star Trek%'

--id for actor Glenn Close
SELECT id, name
FROM actor JOIN casting ON (id = actorid)
WHERE name = 'Glenn Close'

--id for Casablanca
SELECT id
FROM movie
WHERE title = 'Casablanca'

--Cast list for Casablanca
SELECT  name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid = '27'

--Alien cast list
SELECT name
FROM casting
  JOIN actor ON (actorid = actor.id)
  JOIN movie ON (movie.id = movieid)
WHERE
  title = 'Alien'

--Harrison Ford movies
SELECT title
FROM casting
  JOIN actor ON (actorid = actor.id)
  JOIN movie ON (movie.id = movieid)
WHERE
name = 'Harrison Ford'

--Harrison Ford as a supporting actor
SELECT
  title
FROM casting
  JOIN actor ON (actorid = actor.id)
  JOIN movie ON (movie.id = movieid)
WHERE
  actor.name = 'Harrison Ford'
  AND ord != 1

--Lead actors in 1962 movies
SELECT
  title,
  name
FROM casting
  JOIN actor ON (actorid = actor.id)
  JOIN movie ON (movie.id = movieid)
WHERE
  yr = 1962
  AND casting.ord = 1

--Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- Lead actor in Julie Andrews movies
SELECT
  title,
  name
FROM casting
  JOIN movie ON (movieid = movie.id)
  JOIN actor ON (actorid = actor.id)
WHERE
  ord = 1
  AND movieid IN (
    SELECT
    movieid
  FROM casting
    JOIN actor ON (actorid = actor.id)
  WHERE
      name = 'Julie Andrews'
  )

-- Actors with 15 leading roles
SELECT name
FROM casting
  JOIN actor ON (actorid = actor.id)
WHERE
  ord = 1
GROUP BY name
HAVING count(movieid) >= 15
ORDER BY name
