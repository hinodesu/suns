class ChangeDatatypePassOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :pass, :string
  end
end
