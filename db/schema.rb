# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_24_101758) do

  create_table "actor_movies", force: :cascade do |t|
    t.integer "cast_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cast_id", "movie_id"], name: "index_actor_movies_on_cast_id_and_movie_id", unique: true
  end

  create_table "casts", force: :cascade do |t|
    t.string "name"
    t.date "date_of_birth"
    t.integer "no_of_movies"
    t.integer "rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "director_movies", force: :cascade do |t|
    t.integer "cast_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cast_id", "movie_id"], name: "index_director_movies_on_cast_id_and_movie_id", unique: true
  end

  create_table "genre_movies", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id", "movie_id"], name: "index_genre_movies_on_genre_id_and_movie_id", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.integer "ratings"
    t.date "release_date"
    t.integer "rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
