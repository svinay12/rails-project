class CorrectAllColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :type, :property_type
    rename_column :projects, :type, :project_type 
  end
end
