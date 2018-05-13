class AddAttachmentImageToTeleshows < ActiveRecord::Migration[5.1]
  def self.up
    change_table :teleshows do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :teleshows, :image
  end
end
