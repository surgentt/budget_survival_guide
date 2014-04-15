require 'spec_helper'

describe "session" do 

  it "has the content sign in" do
    visit signin_path
    expect(page).to have_content('Sign in')
  end

end