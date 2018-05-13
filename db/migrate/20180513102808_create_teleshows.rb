class CreateTeleshows < ActiveRecord::Migration[5.1]
  def change
    create_table :teleshows do |t|
      t.string :chanel
      t.string :name
      t.string :info

      t.timestamps
    end
  end
end
