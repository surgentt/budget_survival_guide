class BudgetsController < ApplicationController
  Sections = ["income", "housing", "cable_internet", "utilities", "laundry", "commute", "food", "debt_service", "investing", "emergency"]

  def home
    @budget = Budget.new
  end

  def create
    @budget = Budget.create
    redirect_to edit_budget_path(@budget)
  end

  # GET /budgets/1/edit
  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to cable_internet_path(@budget) }
        # format.json { render action: 'show', status: :ok, location: @budget }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end


  # GET /budgets
  # GET /budgets.json
  def index
    @budgets = Budget.all
  end

  # GET /budgets/1
  # GET /budgets/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def budget_params
      params.require(:budget).permit(:income, :healthcare, :state, :income_after_taxes, :housing, :cable_internet, :utilities, :laundry, :commute, :food, :debt_service, :investing, :emergency, :disposable_income)
    end

    def profile_sections
      @profile_sections ||= ProfilesController::Sections
    end
    helper_method :profile_sections

    def current_profile_section
      @current_profile_section ||= (params[:section])
    end
    helper_method :current_profile_section

    def next_profile_section
      @next_profile_section ||= (
        profile_sections[profile_sections.index(current_profile_section)+1] ||
        profile_sections.first
      )
    end
    helper_method :next_profile_section
end
