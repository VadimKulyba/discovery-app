class CreateJoinTableExpeditionPosition < ActiveRecord::Migration[5.1]
  def change
    create_join_table :expeditions, :positions do |t|
      t.integer :count
      # t.index [:expedition_id, :posotion_id]
      # t.index [:posotion_id, :expedition_id]
    end
  end
end
