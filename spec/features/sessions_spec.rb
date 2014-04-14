require 'spec_helper'

describe "session" do 

  it "has the content sign in" do
    visit signin_path
    expect(page).to have_content('Sign in')
  end

  describe "signup" do 
    it "should create a new user" do
      visit signup_path
      fill_in "Email", with: "Surgentt@gmail.com"
      fill_in "Password", with: "password"
    end
  end

end