class AddColumnsInTables < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :generated_by, :string
    add_column :properties, :for_sale, :boolean
  end
end
