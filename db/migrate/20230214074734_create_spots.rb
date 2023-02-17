class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
