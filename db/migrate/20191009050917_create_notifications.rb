class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.string :filename
      t.integer :category
      t.date :d_day

      t.timestamps
    end
  end
end
