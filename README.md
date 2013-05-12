README
===========

sports-news

apikey=btc63ep9wj3xgrr45kqm62yr

Listing Sports

ESPN API: http://api.espn.com/v1/sports
Sports news API: http://sports-news.herokuapp.com//sports.json



Listing Leagues

ESPN API: http://api.espn.com/v1/sports/:sportName
Sports news API: http://sports-news.herokuapp.com/sports/:sportName/leagues.json
Example API: http://sports-news.herokuapp.com/sports/basketball/leagues.json


Listing Teams

ESPN API: http://api.espn.com/v1/sports/:sportName/:leagueName/teams
Sports news API: http://sports-news.herokuapp.com/sports/:sportName/leagues/:leagueName/teams.json
Example API: http://sports-news.herokuapp.com/sports/basketball/leagues/nba/teams.json


Listing Headlines

ESPN API: http://api.espn.com/v1/sports/:sportName/:leagueName/teams/:teamId/news
Sports news API: http://sports-news.herokuapp.com/sports/:sportName/leagues/:leagueName/teams/:teamId/headlines.json
Example API: http://sports-news.herokuapp.com/basketball/leagues/nba/teams/1/headlines.json


Solution Explanation

I am using REST resources to make urls readable.
News are updated using ajax