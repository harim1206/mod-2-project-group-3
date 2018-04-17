class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :image_url
      t.string :password_digest
      t.string :family_info

      t.timestamps
    end
  end
end
