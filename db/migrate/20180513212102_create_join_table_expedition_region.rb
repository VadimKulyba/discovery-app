class CreateJoinTableExpeditionRegion < ActiveRecord::Migration[5.1]
  def change
    create_join_table :expeditions, :regions do |t|
      t.integer :distance
      # t.index [:expedition_id, :region_id]
      # t.index [:region_id, :expedition_id]
    end
  end
end
