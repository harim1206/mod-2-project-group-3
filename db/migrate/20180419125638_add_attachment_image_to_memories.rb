class AddAttachmentImageToMemories < ActiveRecord::Migration[5.1]
  def self.up
    change_table :memories do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :memories, :image
  end
end
