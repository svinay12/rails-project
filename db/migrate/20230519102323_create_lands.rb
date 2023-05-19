class CreateLands < ActiveRecord::Migration[6.0]
  def change
    create_table :lands do |t|
      t.integer :price
      t.string :land_area

      t.timestamps
    end
  end
end
