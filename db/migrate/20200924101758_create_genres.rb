class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end

    create_table :genre_movies do |t|
      t.integer :genre_id
      t.integer :movie_id

      t.timestamps
    end
    add_index :genre_movies, [:genre_id, :movie_id], unique: true
  end
end
