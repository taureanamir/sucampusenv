class AddDefaultValueToArticles < ActiveRecord::Migration[5.1]
  def up
    change_column :articles, :is_published, :boolean, :default => false
    change_column :articles, :uploaded_date, :date, :default => Time.now
  end
end
