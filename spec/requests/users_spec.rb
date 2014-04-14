require 'spec_helper'

describe "users" do 

  it "has the content Sign up" do
    get signup_path
    expect(response).to have_content('Sign up')
  end

end