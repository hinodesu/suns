class RenameColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :class, :class_room
  end
end
