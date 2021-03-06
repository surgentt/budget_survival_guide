class BudgetsController < ApplicationController
  before_action :correct_user,   only: :destroy
  Sections = ["income", "state", "housing", "cable_internet", "utilities", "laundry", "commute", "food", "debt_service", "investing", "emergency", "result"]

  def create
    if signed_in?
      @budget = current_user.budgets.create
    else
      @user = User.create_guest
      @budget = @user.budgets.create
      sign_in @user
    end
    redirect_to budget_edit_path(@budget)
  end

  def edit
    @budget = Budget.find(params[:budget_id])
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to budget_edit_path(@budget, :section => next_budget_section)
    else
      render action: 'edit' 
    end
  end

  def destroy
    Budget.find(params[:id]).destroy
    redirect_to root_path 
  end

  private
    def budget_params
      params.require(:budget).permit(:income, :healthcare, :state, :income_after_taxes, :housing, :cable_internet, :utilities, :laundry, :commute, :food, :debt_service, :investing, :emergency, :disposable_income)
    end

    def budget_sections
      @budget_sections ||= BudgetsController::Sections
    end
    helper_method :budget_sections

    def current_budget_section
      @current_budget_section ||= (params[:section])
    end
    helper_method :current_budget_section

    def next_budget_section
      @next_budget_section ||= (
        budget_sections[budget_sections.index(current_budget_section)+1] ||
        budget_sections.first
      )
    end
    helper_method :next_budget_section

    def correct_user
      @budget = current_user.budgets.find_by(id: params[:id])
      redirect_to root_url if @budget.nil?
    end
end
