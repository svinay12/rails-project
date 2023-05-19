class AddIndexToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :owner, polymorphic: true, index: true
  end
end
