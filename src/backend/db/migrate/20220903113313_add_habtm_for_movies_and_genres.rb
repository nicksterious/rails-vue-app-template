class AddHabtmForMoviesAndGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres_movies, id: false do |t|
	t.belongs_to :movie
	t.belongs_to :genre
	t.index [:movie_id, :genre_id], name: "movies_genres_unique_index", unique: true
    end
  end
end
