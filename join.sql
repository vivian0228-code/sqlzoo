
/*
For every match involving 'POL', show the matchid, date and the number of goals scored.
*/
SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON (id = matchid) 
WHERE (team1='POL' OR team2='POL')
GROUP BY mdate, matchid
ORDER BY COUNT(teamid) DESC
