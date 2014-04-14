require 'spec_helper'

describe "pages" do

  it "home page renders successfully'" do
    visit root_path
    expect(page).to have_content('Will you survive the year (financially)?')

  end

  it "about page render successfully" do
    visit about_path
    expect(page).to have_content('Brian')
  end
end