class AddHabtmForMoviesAndDirectors < ActiveRecord::Migration[6.1]
  def change
    create_table :directors_movies, id: false do |t|
	t.belongs_to :movie
	t.belongs_to :director
    end
  end
end
