class CreateAnnualEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :annual_events do |t|
      t.string :filename

      t.timestamps
    end
  end
end
