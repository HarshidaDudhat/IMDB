class Cast < ApplicationRecord
    
	
	validates :name, :date_of_birth, :no_of_movies, :rank, presence: true
	
	has_many :director_movies
	has_many :actor_movies

	has_many :movies_directed, through: :director_movies, source: :cast
	has_many :movies_acted, through: :actor_movies, source: :cast

end
