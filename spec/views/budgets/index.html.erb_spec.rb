require 'spec_helper'

describe "budgets/index" do
  before(:each) do
    assign(:budgets, [
      stub_model(Budget,
        :income => 1,
        :healthcare => 2,
        :state => "State",
        :income_after_taxes => 3,
        :housing => 4,
        :cable_internet => 5,
        :utilities => 6,
        :laundry => 7,
        :commute => 8,
        :food => 9,
        :debt_service => 10,
        :investing => 11,
        :emergency => 12,
        :disposable_income => 13
      ),
      stub_model(Budget,
        :income => 1,
        :healthcare => 2,
        :state => "State",
        :income_after_taxes => 3,
        :housing => 4,
        :cable_internet => 5,
        :utilities => 6,
        :laundry => 7,
        :commute => 8,
        :food => 9,
        :debt_service => 10,
        :investing => 11,
        :emergency => 12,
        :disposable_income => 13
      )
    ])
  end

  it "renders a list of budgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
  end
end
