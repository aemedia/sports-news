class ApplicationController < ActionController::Base
  protect_from_forgery
  require 'open-uri'
  require 'espn_api'
end
