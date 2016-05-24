class RenameFieldInIdeas < ActiveRecord::Migration
  def change
    rename_column :ideas, :idea_text, :description
  end
end
