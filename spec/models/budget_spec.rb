require 'spec_helper'

describe Budget do

  it "translates the state to a tax level" do
    budget = Budget.create(state: "NY")
    expect(budget.translate_state_to_tax).to eq(0.3)
  end

  it "calcualtes the income after taxes" do
    budget = Budget.create(income: 72000, state: "NY")
    expect(budget.income_after_taxes_calc).to eq(50400)
  end

  it "calcualtes the income in months" do 
    
  end
  
end
