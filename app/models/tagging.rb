class Tagging < ActiveRecord::Base
  belongs_to :idea
  belongs_to :tag
end
