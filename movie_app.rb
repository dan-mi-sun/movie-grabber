require 'sinatra'
require 'mongo'
require 'pry'
require 'httparty'
require_relative 'movie'

get '/' do
 # Just have a nice welcome page
  erb :movie, { :locals => {
  :m => params["name"]
  } }
  
end

post '/film' do
  # Search for a Movie
  # HINT - what is in params ?
 # "You picked #{params["name"]}"

  # Lookup the film information on the web
  film = Movie.get_film_info(params["name"])

  # store the film in the database

  # Display the movie in the page
  erb :movie, { :locals => { 
    :movie_title => film.title,
    :movie_actors => film.actors,
    :movie_director => film.director,
    :movie_year => film.year,
    :movie_plot => film.plot
  }}
end
