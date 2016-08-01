require 'rails_helper'



RSpec.describe Idea, type: :model do
  let!(:idea) { FactoryGirl.create(:idea,id: 1, description: "idea_test") }
  let!(:tag1) { FactoryGirl.create(:tag, id:1, name: "tag1_test1") }
  let!(:tag2) { FactoryGirl.create(:tag, id:2, name: "tag2_test2") }
  let!(:tagging1) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:1) }
  let!(:tagging2) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:2) }


  it "Method all_tags should be return tags separate by comma" do
    idea = Idea.where("id = ?", 1)

    stringtag = ""
    idea.map do |tag|
      stringtag += tag.all_tags
    end
    expect(stringtag).to eq("tag1_test1, tag2_test2")
  end
end
