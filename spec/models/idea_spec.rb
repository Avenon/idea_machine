require 'rails_helper'

RSpec.describe Idea, type: :model do
  let!(:idea) { FactoryGirl.create(:idea,id: 1, description: "idea_test") }
  let!(:tag1) { FactoryGirl.create(:tag, id:2, name: "tag1_test1") }
  let!(:tag2) { FactoryGirl.create(:tag, id:3, name: "tag2_test2") }
  let!(:tagging1) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:2) }
  let!(:tagging2) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:3) }

  it "Method all_tags should be return tags separate by comma" do
    idea = Idea.where("id = ?", 1)

    stringtag = ""
    idea.map do |tag|
      stringtag += tag.all_tags
    end
    expect(stringtag).to eq("tag1_test1, tag2_test2")
  end

  it "Method all_tags= should be write only one record" do
    idea = Idea.where("id = ?", 1)

    # Let's add only one new tag names "tag3_test3"
    # It should be write on database without another tags
    idea.map do |i|
      i.all_tags=("tag1_test1,tag2_test2,tag3_test3")
    end

    # Let's check that id's tag1_test1 are unchange
    tag = Tag.where("id = ?", 2)
    expect(tag.last.name).to eq("tag1_test1")
  end

  it "Method tagged_with should be return all ideas by tag" do
    idea = Idea.tagged_with("tag2_test2")
    expect(idea.last.description).to eq("idea_test")
  end
end
