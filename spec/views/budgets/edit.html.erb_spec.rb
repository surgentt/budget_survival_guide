require 'spec_helper'

describe "budgets/edit" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :income => 1,
      :healthcare => 1,
      :state => "MyString",
      :income_after_taxes => 1,
      :housing => 1,
      :cable_internet => 1,
      :utilities => 1,
      :laundry => 1,
      :commute => 1,
      :food => 1,
      :debt_service => 1,
      :investing => 1,
      :emergency => 1,
      :disposable_income => 1
    ))
  end

  it "renders the edit budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", budget_path(@budget), "post" do
      assert_select "input#budget_income[name=?]", "budget[income]"
      assert_select "input#budget_healthcare[name=?]", "budget[healthcare]"
      assert_select "input#budget_state[name=?]", "budget[state]"
      assert_select "input#budget_income_after_taxes[name=?]", "budget[income_after_taxes]"
      assert_select "input#budget_housing[name=?]", "budget[housing]"
      assert_select "input#budget_cable_internet[name=?]", "budget[cable_internet]"
      assert_select "input#budget_utilities[name=?]", "budget[utilities]"
      assert_select "input#budget_laundry[name=?]", "budget[laundry]"
      assert_select "input#budget_commute[name=?]", "budget[commute]"
      assert_select "input#budget_food[name=?]", "budget[food]"
      assert_select "input#budget_debt_service[name=?]", "budget[debt_service]"
      assert_select "input#budget_investing[name=?]", "budget[investing]"
      assert_select "input#budget_emergency[name=?]", "budget[emergency]"
      assert_select "input#budget_disposable_income[name=?]", "budget[disposable_income]"
    end
  end
end
