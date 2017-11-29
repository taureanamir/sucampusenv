class AddIsPublishedToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_publised, :boolean
  end
end
