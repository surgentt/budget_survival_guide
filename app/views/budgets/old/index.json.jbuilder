json.array!(@budgets) do |budget|
  json.extract! budget, :id, :income, :healthcare, :state, :income_after_taxes, :housing, :cable_internet, :utilities, :laundry, :commute, :food, :debt_service, :investing, :emergency, :disposable_income
  json.url budget_url(budget, format: :json)
end
