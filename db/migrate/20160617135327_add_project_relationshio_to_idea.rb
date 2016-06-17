class AddProjectRelationshioToIdea < ActiveRecord::Migration
  def change
    change_table :ideas do |t|
      t.belongs_to :project, index: true
    end
  end
end
