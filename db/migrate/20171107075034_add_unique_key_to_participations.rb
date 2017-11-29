class AddUniqueKeyToParticipations < ActiveRecord::Migration[5.1]
  def change
    add_index :participations, [:user_id, :event_id], :unique => true
  end
end
