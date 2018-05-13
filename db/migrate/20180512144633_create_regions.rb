class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name, null: false
      t.string :space_type
      t.string :description
      t.integer :danger_level
      t.string :space

      t.timestamps
    end
  end
end
