class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :title
      t.text :descrition
      t.timestamps null: false
    end
  end
end
