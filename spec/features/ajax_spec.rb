require "rails_helper"

describe 'Check ajax', js: true do

  let!(:user) { create(:user, email: "test555@test555.ru", password: "test1234") }

  before(:each) do
    login("test555@test555.ru", "test1234")
  end

  it "Idea should be create with ajax in database", driver: :poltergeist do

    fill_in :idea_description, with: "Idea test"
    click_button "Отправить"
    wait_for_ajax
    expect(Idea.last.description).to eq("Idea test")
  end

  it "New idea should be view on current page after submit", driver: :poltergeist do

    fill_in :idea_description, with: "Idea test"
    click_button "Отправить"
    wait_for_ajax
    expect(page.find(:xpath, ".//*[@id='idea_1']").text).to eq('From less than a minute Idea test')
  end

  it "Div block witn new idea should be contain class pull-right", driver: :poltergeist do

    fill_in :idea_description, with: "Idea test"
    click_button "Отправить"
    wait_for_ajax
    expect(page).to have_css('.pull-right')
  end
end
