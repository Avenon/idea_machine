require "rails_helper"

RSpec.describe IdeasHelper, :type => :helper do
  let!(:idea) { FactoryGirl.create(:idea,id: 1, description: "idea_test") }
  let!(:idea2) { FactoryGirl.create(:idea,id: 2, description: "idea2_test2") }
  let!(:idea3) { FactoryGirl.create(:idea,id: 3, description: "idea3_test3") }
  let!(:tag1) { FactoryGirl.create(:tag, id:2, name: "tag1_test1") }
  let!(:tag2) { FactoryGirl.create(:tag, id:3, name: "tag2_test2") }
  let!(:tagging1) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:2) }
  let!(:tagging2) { FactoryGirl.create(:tagging, idea_id: 1, tag_id:3) }
  let!(:tagging3) { FactoryGirl.create(:tagging, idea_id: 2, tag_id:3) }
  let!(:tagging4) { FactoryGirl.create(:tagging, idea_id: 3, tag_id:3) }

  it "helper should be generate correct links" do
    expect(helper.tag_links("tag1,tag2,tag3")).to eq('<a href="/tags/tag1">tag1</a>, <a href="/tags/tag2">tag2</a>, <a href="/tags/tag3">tag3</a>')
  end

  it "helper should be generate correct links with classes according to count tag" do
    a = []
    helper.tag_cloud Tag.counts, %w{css1 css2 css3 css4} do |tag, css_class|
      a << (link_to tag.name, tag_path(tag.name), class: css_class)
    end

    expect(a.join(", ")).to eq('<a class="css2" href="/tags/tag1_test1">tag1_test1</a>, <a class="css4" href="/tags/tag2_test2">tag2_test2</a>')
  end
end
