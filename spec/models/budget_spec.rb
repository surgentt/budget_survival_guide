require 'spec_helper'

describe Budget do

  it "has a valid factory" do
    expect(create(:budget)).to be_valid
  end

  it "translates the state to a tax level" do
    budget = Budget.create(state: "NY")
    expect(budget.translate_state_to_tax).to eq(0.3)
  end

  it "calcualtes the income after taxes" do
    budget = Budget.create(income: 72000, state: "NY")
    expect(budget.income_after_taxes_calc).to eq(50400)
  end

  it "calcualtes the income in months" do 
    budget = Budget.create(income: 72000, state: "NY")
    expect(budget.income_in_months).to eq(6000)
  end

  it "calculates income per month after taxes" do
    budget = Budget.create(income: 72000, state: "AL")
    expect(budget.income_after_taxes_in_months).to eq(4200)
  end

  it "calculates total disposable income per month" do
    budget = create(:budget, disposable_income: nil)
    expect(budget.disposable_income_calc).to eq(1652)
  end

  it "calculates total emergency funds after one year" do 
    budget = Budget.create(emergency: 100)
    expect(budget.emergency_yearly).to eq(1200)
  end
  
end
