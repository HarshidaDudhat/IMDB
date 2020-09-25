class Movie < ApplicationRecord
    

	validates :name, :ratings, :release_date, :rank, presence:true

	has_many :director_movies
	has_many :actor_movies
	has_many :genre_movies

	has_many :directors, through: :director_movies, source: :movie
	has_many :actors, through: :actor_movies, source: :movie
	has_many :genres, through: :genre_movies, source: :movie

	def update_actors(new_actor_ids)
		#puts new_actor_ids
		existing_actor_ids = actor_movies.pluck(:cast_id)
		actor_ids_to_delete = existing_actor_ids - new_actor_ids
		actor_ids_to_add = new_actor_ids - existing_actor_ids
		actor_movies.where(cast_id: actor_ids_to_delete).delete_all
		new_actor_ids.each do |actor_id_to_add|
			actor_movies.create! cast_id:actor_id_to_add
		end
	end

	def update_genres(new_genre_ids)
		existing_genre_ids = genre_movies.pluck(:genre_id)
		genre_ids_to_delete = existing_genre_ids - new_genre_ids
		genre_ids_to_add = new_genre_ids - existing_genre_ids
		genre_movies.where(genre_id: genre_ids_to_delete).delete_all
		new_genre_ids.each do |genre_id_to_add|
			genre_movies.create! genre_id:genre_id_to_add
		end
	end
end
