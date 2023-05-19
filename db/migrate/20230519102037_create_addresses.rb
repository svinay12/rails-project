class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :plot_no
      t.string :locality
      t.string :city
      t.string :state
      t.string :zipcode
      t.timestamps
    end
  end
end
