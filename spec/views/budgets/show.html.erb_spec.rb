require 'spec_helper'

describe "budgets/show" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/State/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/13/)
  end
end
