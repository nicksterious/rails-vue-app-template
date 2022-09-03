class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.integer :runtime
      t.text :plot
      t.string :poster_url
      t.float :rating
      t.string :page_url

      t.timestamps
    end
  end
end
