require 'sinatra'
require_relative "sf_home_game_parser"

get '/' do
  if is_game_today?
    @giants_status = "There's a Giants home game today! Your commute will likely be affected."
  else
    @giants_status = "No Giants home game today! Your commute may face other dangers."
  end
  erb :home
end
