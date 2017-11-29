class AddIsApprovedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :is_approved, :boolean, :default => false
  end
end
