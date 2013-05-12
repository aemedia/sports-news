class EspnApi
  @api_key = "btc63ep9wj3xgrr45kqm62yr"
  
  def self.api_key
    @api_key
  end
  
  def self.sports_url
    "http://api.espn.com/v1/sports?apikey=#{@api_key}"
  end
  
  def self.leagues_url(sports_name)
    "http://api.espn.com/v1/sports/#{sports_name}?apikey=#{@api_key}"
  end
  
  def self.teams_url(sports_name,league_name)
    "http://api.espn.com/v1/sports/#{sports_name}/#{league_name}/teams?apikey=#{@api_key}"
  end
  
  def self.news_url(sports_name,league_name,team_id)
    "http://api.espn.com/v1/sports/#{sports_name}/#{league_name}/teams/#{team_id}/news?apikey=#{@api_key}"
  end
  
  
end


puts EspnApi.api_key
puts EspnApi.sports_url
puts EspnApi.leagues_url('basketball')
puts EspnApi.teams_url('basketball','nba')
puts EspnApi.news_url('basketball','nba','1')