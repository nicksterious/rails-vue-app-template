# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_09_03_113318) do

  create_table "actors", id: { type: :string, limit: 128 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "actors_movies", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.string "actor_id"
    t.index ["actor_id"], name: "index_actors_movies_on_actor_id"
    t.index ["movie_id", "actor_id"], name: "movies_actors_unique_index", unique: true
    t.index ["movie_id"], name: "index_actors_movies_on_movie_id"
  end

  create_table "directors", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "directors_movies", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "director_id"
    t.index ["director_id"], name: "index_directors_movies_on_director_id"
    t.index ["movie_id", "director_id"], name: "directors_movies_unique_index", unique: true
    t.index ["movie_id"], name: "index_directors_movies_on_movie_id"
  end

  create_table "genres", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_movies", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id", "genre_id"], name: "movies_genres_unique_index", unique: true
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "movies", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.integer "runtime"
    t.text "plot"
    t.string "poster_url"
    t.float "rating"
    t.string "page_url"
  end

end
