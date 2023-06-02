class RemoveQuotationFile < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :quotation_file
  end
end
