class AddPositionToForm < ActiveRecord::Migration[5.1]
  def change
    add_column :forms, :position, :string
  end
end
