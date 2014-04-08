class BudgetsController < ApplicationController
  Sections = ["income", "housing", "cable_internet", "utilities", "laundry", "commute", "food", "debt_service", "investing", "emergency"]

  def home
  end

  def create
    @budget = Budget.create
    redirect_to budget_edit_path(@budget)
  end

  def edit
    @budget = Budget.find(params[:budget_id])
  end

  def update
    #binding.pry
    @budget = Budget.find(params[:id])
    if @budget.update(budget_params)
      redirect_to budget_edit_path(@budget, :section => next_budget_section)
    else
      render action: 'edit' 
    end
  end

  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def destroy
    @budget.destroy
    respond_to do |format|
      format.html { redirect_to budgets_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
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
end
