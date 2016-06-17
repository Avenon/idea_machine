class AddProjectRelationsToUser < ActiveRecord::Migration
  def change
    change_table :projects do |t|
      t.belongs_to :user, index: true
    end
  end
end
