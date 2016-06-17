class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  validates :description, presence: true
end
