class AddMoreColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :degree, :string
    add_column :users, :fos, :string
    add_column :users, :batch, :string
  end
end
