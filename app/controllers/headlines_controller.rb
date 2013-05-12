class HeadlinesController < ApplicationController
  def index
    news_url = EspnApi.news_url(params[:sport_id],params[:league_id],params[:team_id])
    @news = open(news_url).read
    @parsed_news = JSON.parse(@news)["headlines"]
    respond_to do |format|
      format.html
      format.json { render :json => @news }
    end
  end
end
