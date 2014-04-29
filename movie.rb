class Movie

  # Add attr_accessors for the values you want to store...
  attr_accessor :title
  attr_accessor :actors
  attr_accessor :director
  attr_accessor :year
  attr_accessor :plot

  def self.get_film_info(name)
    imdb_data = HTTParty.get("http://www.omdbapi.com/?t=#{name}")
    movie_info = JSON(imdb_data)

    # Create a Movie object...
    m = Movie.new

    # Fill in the attributes...
    m.title = movie_info["Title"] 
    m.actors = movie_info["Actors"]
    m.director = movie_info["Director"]
    m.year = movie_info["Year"]
    m.plot = movie_info["Plot"]
    return m

    # Store me in a database...
  end

end
