class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :family_name
      t.string :password_digest

      t.timestamps
    end
  end
end
