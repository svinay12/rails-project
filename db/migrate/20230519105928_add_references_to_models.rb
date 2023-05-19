class AddReferencesToModels < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :users, index: true
    add_reference :lands, :users, index: true
  end
end
