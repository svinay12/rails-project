class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.integer :budget
      t.datetime :time
      t.string :type
      t.string :quotation_file
      t.text :details

      t.references :client, null: false # Remove foreign_key: true
      t.references :builder, null: false # Remove foreign_key: true

      t.timestamps
    end

    add_foreign_key :projects, :users, column: :client_id
    add_foreign_key :projects, :users, column: :builder_id
  end
end
