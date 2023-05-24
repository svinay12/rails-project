class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :users_id, :user_id
  end
end
