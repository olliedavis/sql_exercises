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