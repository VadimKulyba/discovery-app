class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.integer :user_id
      t.integer :expedition_id

      t.timestamps
    end
    add_index :forms, :user_id
    add_index :forms, :expedition_id
  end
end
