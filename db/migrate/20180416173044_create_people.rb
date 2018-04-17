class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :bio
      t.date :dob
      t.date :dod
      t.string :image_url
      t.boolean :is_account, default: false
      t.string :username
      t.string :password_digest
      t.integer :family_id

      t.timestamps
    end
  end
end
