# game
# id	mdate	stadium	team1	team2
# 1001	8 June 2012	National Stadium, Warsaw	POL	GRE
# 1002	8 June 2012	Stadion Miejski (Wroclaw)	RUS	CZE
# 1003	12 June 2012	Stadion Miejski (Wroclaw)	GRE	CZE
# 1004	12 June 2012	National Stadium, Warsaw	POL	RUS
# ...
#
# goal
# matchid	teamid	player	gtime
# 1001	POL	Robert Lewandowski	17
# 1001	GRE	Dimitris Salpingidis	51
# 1002	RUS	Alan Dzagoev	15
# 1002	RUS	Roman Pavlyuchenko	82
# ...
#
# eteam
# id	teamname	coach
# POL	Poland	Franciszek Smuda
# RUS	Russia	Dick Advocaat
# CZE	Czech Republic	Michal Bilek
# GRE	Greece	Fernando Santos
# ...


#1.
# The first example shows the goal scored by a player with the last name 'Bender'.
# Modify it to show the matchid and player name for all goals scored by Germany.

SELECT matchid, player
  FROM goal
 WHERE teamid = 'GER'

# 2.
# From the previous query you can see that Lars Bender's scored a goal in game 1012.
# Now we want to know what teams were playing in that match.
# Show id, stadium, team1, team2 for just game 1012

SELECT id,stadium,team1,team2
  FROM game
 WHERE id = 1012#

# 3.
# The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.
# SELECT player,stadium
# FROM game JOIN goal ON (id=matchid)
# Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate
  FROM game
  JOIN goal ON id = matchid
 WHERE teamid = 'ger'
# 4.
# Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

SELECT team1, team2, player
  FROM game
  JOIN goal ON id = matchid
 WHERE player LIKE 'MARIO%'
# 5.
# Show player, teamid, coach, gtime for all goals scored in the first 10 minutes

SELECT player, teamid, coach, gtime
  FROM goal
  JOIN eteam on teamid = id
 WHERE gtime<=10
# 6.
# List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

SELECT mdate, teamname
  FROM game
  JOIN eteam ON team1 = eteam.id
 WHERE coach = 'Fernando Santos'

# 7.
# List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

SELECT player
  FROM goal
  JOIN game ON matchid = id
 WHERE stadium = 'National Stadium, Warsaw'

# 8.
# Show the name of all players who scored a goal against Germany.

SELECT DISTINCT player
  FROM goal
  JOIN game ON matchid = id
 WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER'

# 9.
# Show teamname and the total number of goals scored.

  SELECT teamname, COUNT(player)
    FROM eteam
    JOIN goal ON id=teamid
GROUP BY teamname

# 10.
# Show the stadium and the number of goals scored in each stadium.

  SELECT Stadium, COUNT(player)
    FROM game
    JOIN goal ON id=matchid
GROUP BY stadium

