require 'spec_helper'

feature 'Budget Creation' do 

  scenario "creates a new budget" do
    visit root_path
    click_button "Create Budget"
    fill_in "budget_income", with: 70000
    click_button "Next"
    select('New York', :from => 'budget_state')
    click_button "Next"
    fill_in "budget_housing", with: 1325
    click_button "Next"
    fill_in "budget_cable_internet", with: 100
    click_button "Next"
    fill_in "budget_utilities", with: 150
    click_button "Next"
    fill_in "budget_laundry", with: 110
    click_button "Next"
    fill_in "budget_commute", with: 110
    click_button "Next"
    fill_in "budget_food", with: 110
    click_button "Next"
    fill_in "budget_debt_service", with: 110
    click_button "Next"
    fill_in "budget_investing", with: 110
    click_button "Next"
    fill_in "budget_emergency", with: 110
    click_button "Next"
    expect(page).to have_content 'Checkout your budget'
  end

  scenario 

end