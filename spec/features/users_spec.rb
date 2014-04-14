require 'spec_helper'

describe "users" do 

  it "has the content Sign up" do
    visit signup_path
    expect(page).to have_content('Sign up')
  end

  describe "signup" do 
    it "should create a new user" do
      visit signup_path
      fill_in "Email", with: "Surgentt@gmail.com"
      fill_in "Password", with: "password"
      fill_in "Password Confirmation", with: "password"
      expect{ click_button ('Create my account') }.to change(User, :count).by(1)
    end
  end
end