class AddColumnsToParticipation < ActiveRecord::Migration[5.1]
  def change
    add_column :participations, :fos, :string
  end
end
