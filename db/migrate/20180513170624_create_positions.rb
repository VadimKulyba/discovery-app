class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string :name, null: false
      t.string :info
      t.timestamps
    end
  end
end
