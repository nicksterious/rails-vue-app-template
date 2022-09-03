class AddHabtmForMoviesAndGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :movies_genres, id: false do |t|
	t.belongs_to :movie
	t.belongs_to :genre
    end
  end
end
