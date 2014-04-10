require 'spec_helper'

describe "Budgets" do

  describe 'GET /budgets/:id/edit/:sections' do
    it 'renders successfully' do
      budget = create(:budget)
      BudgetsController::Sections.each do |section|
        get budget_edit_path(:id => budget.id, :section => section)
        response.should be_successful
      end
    end
  end

end
