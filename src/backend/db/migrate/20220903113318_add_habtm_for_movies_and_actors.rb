class AddHabtmForMoviesAndActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors_movies, id: false do |t|
	t.belongs_to :movie
	t.belongs_to :actor, type: :string
    end
  end
end
