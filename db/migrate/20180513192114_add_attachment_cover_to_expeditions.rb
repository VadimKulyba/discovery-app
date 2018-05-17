class AddAttachmentCoverToExpeditions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :expeditions do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :expeditions, :cover
  end
end
