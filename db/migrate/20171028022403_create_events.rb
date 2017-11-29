class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :event_date
      t.string :event_time
      t.string :contact

      t.timestamps
    end
  end
end
