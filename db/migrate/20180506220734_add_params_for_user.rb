class AddParamsForUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :department, :string
    add_column :users, :description, :string
    add_column :users, :role, :string, null: false, default: 'user'
  end
end
