class AddRelationshipToIdeas < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.belongs_to :user, index: true
    end
  end
end
