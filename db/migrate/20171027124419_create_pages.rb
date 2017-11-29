class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :order

      t.timestamps
    end
  end
end
