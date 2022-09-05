class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors, id: false do |t|
      t.string :id, limit: 128, primary_key: true
      t.string :first_name
      t.string :last_name
    end
  end
end
