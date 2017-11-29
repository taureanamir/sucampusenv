class RemoveFirstNameFromParticipations < ActiveRecord::Migration[5.1]
  def change
    remove_column :participations, :first_name
    remove_column :participations, :last_name
    remove_column :participations, :status
  end
end
