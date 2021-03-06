class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.string :subject
      t.string :title
      t.date :deadline
      t.string :filename
      t.integer :grade
      t.integer :class_room
      t.integer :student1
      t.integer :student2
      t.integer :student3
      t.integer :student4
      t.integer :student5
      t.integer :student6
      t.integer :student7
      t.integer :student8
      t.integer :student9
      t.integer :student10
      t.integer :student11
      t.integer :student12
      t.integer :student13
      t.integer :student14
      t.integer :student15
      t.integer :student16
      t.integer :student17
      t.integer :student18
      t.integer :student19
      t.integer :student20
      t.integer :student21
      t.integer :student22
      t.integer :student23
      t.integer :student24
      t.integer :student25
      t.integer :student26
      t.integer :student27
      t.integer :student28
      t.integer :student29
      t.integer :student30
      t.integer :student31
      t.integer :student32
      t.integer :student33
      t.integer :student34
      t.integer :student35
      t.integer :student36
      t.integer :student37
      t.integer :student38
      t.integer :student39
      t.integer :student40

      t.timestamps
    end
  end
end
