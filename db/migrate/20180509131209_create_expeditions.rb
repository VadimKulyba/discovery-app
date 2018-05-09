class CreateExpeditions < ActiveRecord::Migration[5.1]
  def change
    create_table :expeditions do |t|
      t.string :name, null: false
      t.string :target, null: false
      t.string :plan, default: ''
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.timestamps
    end
    add_index :expeditions, :name
  end
end
