class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name
      # TODO index on name for RoR-side query object searches
    end
  end
end
