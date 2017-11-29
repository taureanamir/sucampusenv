class AddIsCompletedToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_completed, :boolean
  end
end
