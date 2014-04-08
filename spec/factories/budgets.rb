# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :budget do
    income 1
    healthcare 1
    state "MyString"
    income_after_taxes 1
    housing 1
    cable_internet 1
    utilities 1
    laundry 1
    commute 1
    food 1
    debt_service 1
    investing 1
    emergency 1
    disposable_income 1
  end
end
