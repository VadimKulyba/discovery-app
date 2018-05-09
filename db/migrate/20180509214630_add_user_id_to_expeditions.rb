class AddUserIdToExpeditions < ActiveRecord::Migration[5.1]
  def change
    add_column :expeditions, :user_id, :integer
  end
end
