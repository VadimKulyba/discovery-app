class CreateJoinTableExpeditionTeleshow < ActiveRecord::Migration[5.1]
  def change
    create_join_table :expeditions, :teleshows do |t|
      # t.index [:expedition_id, :teleshow_id]
      # t.index [:teleshow_id, :expedition_id]
    end
  end
end
