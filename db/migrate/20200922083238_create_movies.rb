class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :ratings
      t.date :release_date
      t.integer :rank

      t.timestamps
     
    end
    
    create_table :casts do |t|
        t.string :name
        t.date :date_of_birth
        t.integer :no_of_movies
        t.integer :rank
  
        t.timestamps
        
      
    end
    

    create_table :actor_movies do |t|
      t.integer :cast_id
      t.integer :movie_id
      
      t.timestamps
    end
    add_index :actor_movies, [:cast_id, :movie_id], unique: true

    create_table :director_movies do |t|
      t.integer :cast_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :director_movies, [:cast_id, :movie_id], unique: true
  end
end
