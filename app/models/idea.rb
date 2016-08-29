class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  validates :description, presence: true

  def all_tags=(names)
    self.tags = names.split(",").uniq.map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).uniq.join(", ")
  end

  def self.tagged_with(userid, name)
    Tag.find_by_name!(name).ideas.where("user_id = ?", userid)
  end
end
