class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :ratings
      t.date :release_date
      t.integer :rank

      t.timestamps
      t.string :slug
    end
    add_index "movies", ["slug"], name: "index_movies_on_slug", unique: true

    create_table :casts do |t|
        t.string :name
        t.date :date_of_birth
        t.integer :no_of_movies
        t.integer :rank
  
        t.timestamps
        t.string :slug
      
    end
    add_index "casts", ["slug"], name: "index_casts_on_slug", unique: true

    create_table :actor_movies do |t|
      t.integer :cast_id
      t.integer :movie_id

      t.timestamps
    end

    create_table :director_movies do |t|
      t.integer :cast_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
