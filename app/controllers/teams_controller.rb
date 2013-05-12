class TeamsController < ApplicationController
  
  def index
    teams_url = EspnApi.teams_url(params[:sport_id],params[:league_id])
    @teams = open(teams_url).read
    
    @parsed_teams = JSON.parse(@teams)["sports"][0]["leagues"]
    
    respond_to do |format|
      format.html
      format.json { render :json => @teams }
    end
  end
  
  
end
