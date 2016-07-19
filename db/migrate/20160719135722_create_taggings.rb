class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :idea, index: true, foreign_key: true
      t.belongs_to :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
