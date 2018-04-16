class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.integer :person_id
      t.integer :memory_id

      t.timestamps
    end
  end
end
