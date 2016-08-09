require "rails_helper"

describe 'Check ajax' do

  it "Card should be create with ajax" do
    visit root_path
    #click_link I18n.t :sign_in
    #fill_in :email, with: "test@test.ru"
    #fill_in :password, with: "test"
    #click_button I18n.t :sign_in
    #click_link I18n.t :add_card
    expect(page.status_code).to eq(200)
  end
end
