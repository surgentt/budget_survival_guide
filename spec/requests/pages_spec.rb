require 'spec_helper'

describe "pages" do

  it "home page renders successfully'" do
    get root_path
    response.should be_successful
  end

  it "about page render successfully" do
    get about_path
    response.should be_successful
  end
end