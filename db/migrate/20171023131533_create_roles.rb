class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :role
      t.string :role_id

      t.timestamps
    end
  end
end