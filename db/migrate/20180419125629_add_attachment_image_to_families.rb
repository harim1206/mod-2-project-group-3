class AddAttachmentImageToFamilies < ActiveRecord::Migration[5.1]
  def self.up
    change_table :families do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :families, :image
  end
end
