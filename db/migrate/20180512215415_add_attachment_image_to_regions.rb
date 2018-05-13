class AddAttachmentImageToRegions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :regions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :regions, :image
  end
end
