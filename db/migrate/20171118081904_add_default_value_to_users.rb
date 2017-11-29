class AddDefaultValueToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :role_id, :integer, :default => 2
  end
end
