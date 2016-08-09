require "rails_helper"

describe 'Check ajax' do
  #let!(:user) { create(:user, email: "test@test.ru", password: "test", password_confirmation: "test") }
  #let!(:card) { FactoryGirl.create(:card, user_id: user.id) }
  let!(:user) { FactoryGirl.create(:user) }

  it "Card should be create with ajax" do
    visit root_path
    click_link "Sign in"
    fill_in :user_email, with: "test@test.ru"
    fill_in :user_password, with: "test1234"
    click_button "Log in"

    #click_link I18n.t :add_card
    expect(page.status_code).to eq(200)
  end
end
