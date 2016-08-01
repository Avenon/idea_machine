require 'rails_helper'

RSpec.describe Tag, type: :model do
  let!(:idea) { FactoryGirl.create(:idea,id: 1, description: "idea_test") }
  let!(:idea2) { FactoryGirl.create(:idea,id: 2, description: "idea2_test2") }
  let!(:tag1) { FactoryGirl.create(:tag, id:2, name: "tag1_test1") }
  let!(:tag2) { FactoryGirl.create(:tag, id:3, name: "tag2_test2") }
  let!(:tagging1) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:2) }
  let!(:tagging2) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:3) }
  let!(:tagging3) { FactoryGirl.create(:tagging, idea_id: 2, tag_id:3) }

  it "Method self.counts should be return all tags name with there count" do
    tag = Tag.counts

    ar1 = []
    tag.map do |t|
      ar1 << "#{t.name} #{t.count}"
    end

    ar2 = []
    tag1 = Tag.select("name, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id,tags.name")
    tag1.map do |i|
      ar2 << "#{i.name} #{i.count}"
    end

    expect(ar1 <=> ar2).to eq(0)

  end
end
