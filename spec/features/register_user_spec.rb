require "rails_helper"

describe 'Check register user' do
  it "User must be register correct" do
    visit root_path
    click_link I18n.t :sign_up
    fill_in :user_email, with: "rspecuser0@rspecuser.ru"
    fill_in :user_password, with: "rspecuser"
    fill_in :user_password_confirmation, with: "rspecuser"
    click_button "Sign up"
    expect(page).to have_content(I18n.t :list_idea)
  end
end
