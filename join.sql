/*
For every match involving 'POL', show the matchid, date and the number of goals scored.
*/
SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON (id = matchid) 
WHERE (team1='POL' OR team2='POL')
GROUP BY mdate, matchid
ORDER BY COUNT(teamid) DESC


/*
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
...
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.
*/
SELECT mdate,
       team1,
       SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
       team2,
       SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 FROM
    game LEFT JOIN goal ON (id = matchid)
    GROUP BY mdate,team1,team2
    ORDER BY mdate, matchid, team1, team2


/*
List the film title and the leading actor for all of the films 'Julie Andrews' played in.
*/
SELECT title, actor.name AS leading_actor
FROM actor 
JOIN casting ON actor.id=actorid
JOIN movie ON movie.id=movieid
WHERE ord=1 AND movieid IN (SELECT movieid FROM casting JOIN actor ON actorid=actor.id WHERE actor.name='Julie Andrews')


/*
Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
*/
SELECT DISTINCT actor.name FROM actor
JOIN casting ON actor.id=actorid
WHERE ord=1 
GROUP BY actor.name
HAVING COUNT(actor.name)>=15
ORDER BY actor.name ASC


/*
List all the people who have worked with 'Art Garfunkel'.
*/
SELECT DISTINCT actor.name FROM actor
JOIN casting ON actor.id=actorid
WHERE movieid IN (SELECT movieid FROM casting JOIN actor ON actor.id=actorid WHERE name='Art Garfunkel') AND name !='Art Garfunkel'

