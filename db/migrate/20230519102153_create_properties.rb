class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :land_area
      t.string :type
      t.string :floor

      t.timestamps
    end
  end
end
