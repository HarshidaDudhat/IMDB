class Movie < ApplicationRecord
    

	validates :name, :ratings, :release_date, :rank, presence:true

	has_many :director_movies
	has_many :actor_movies

	has_many :directors, through: :director_movies, source: :movie
	has_many :actors, through: :actor_movies, source: :movie
end
