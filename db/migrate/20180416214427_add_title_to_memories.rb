class AddTitleToMemories < ActiveRecord::Migration[5.1]
  def change
    add_column :memories, :title, :string
  end
end
