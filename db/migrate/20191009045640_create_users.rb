class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :number
      t.integer :grade
      t.integer :class
      t.string :name
      t.string :kana
      t.string :gender
      t.integer :pass

      t.timestamps
    end
  end
end
