require 'spec_helper'

describe "users" do 

  it "has the content Sign up" do
    visit signup_path
    expect(page).to have_content('Sign up')
  end

end