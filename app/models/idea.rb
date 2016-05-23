class Idea < ActiveRecord::Base
validates :idea_text, presence: true
end
