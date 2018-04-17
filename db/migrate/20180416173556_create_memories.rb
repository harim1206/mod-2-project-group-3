class CreateMemories < ActiveRecord::Migration[5.1]
  def change
    create_table :memories do |t|
      t.string :image_url
      t.string :description
      t.date :date
      t.string :memory_title
      t.integer :family_id

      t.timestamps
    end
  end
end
