class Idea < ActiveRecord::Base
validates :description, presence: true
end
