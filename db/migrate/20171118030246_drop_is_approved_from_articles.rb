class DropIsApprovedFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :is_approved
  end
end
