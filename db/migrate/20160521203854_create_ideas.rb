class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea_text
      t.timestamps null: false
    end
  end
end
