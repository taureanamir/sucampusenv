class AddFieldsToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :first_name, :string
    add_column :participations, :last_name, :string
    add_column :participations, :status, :string
  end
end
