class LeaguesController < ApplicationController
  
  def index
    legues_url = EspnApi.leagues_url(params[:sport_id])
    @leagues = open(legues_url).read
    @parsed_leagues = JSON.parse(@leagues)["sports"][0]["leagues"]  
    respond_to do |format|
      format.html
      format.json { render :json => @leagues }
    end
  end
  
end
