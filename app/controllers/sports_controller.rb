class SportsController < ApplicationController
  
  def index
    sports_url = EspnApi.sports_url
    @sports = open(sports_url).read
    @parsed_sports = JSON.parse(@sports)["sports"]
    
    respond_to do |format|
      format.html
      format.json { render :json => @sports }
    end
  end
  
  def show
    legues_url = EspnApi.leagues_url(params[:id])
    @leagues = open(legues_url).read
    respond_to do |format|
      format.json { render :json => @leagues }
    end
  end
  
end
