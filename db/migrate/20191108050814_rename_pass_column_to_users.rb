class RenamePassColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :pass, :password
  end
end
