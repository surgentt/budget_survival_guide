require 'spec_helper'

describe BudgetsController do

  describe "POST #create" do
    it "creates a new guest user" do 
      count = User.all.count
      post :create 
      expect(User.count).to eq(count+1)
    end

    it "redirect to the budget edit path first section" do 
      post :create
      expect(response).to redirect_to budget_edit_path(:budget_id => 1, :section => BudgetsController::Sections.first)
    end
  end

  describe "GET #edit" do
    it "renders the :edit template with the income section by default" do 
      budget = create(:budget)
      get :edit, :budget_id => budget.id, :section => "", use_route: :budget_edit
      expect(response).to render_template("edit")
    end

    it "renders the :edit template w/ the state selection state" do 
      budget = create(:budget)
      get :edit, :budget_id => budget.id, :section => "state", use_route: :budget_edit
      expect(response).to render_template("edit")
    end
  end
  
  describe "PATCH #update" do
    before :each do 
      @budget = Budget.create
    end

    it "changes @budgets attributes" do 
      patch :update, :id => @budget, :budget => {:income => 70000}, :section => BudgetsController::Sections.first
      @budget.reload
      expect(@budget.income).to eq(70000)
    end

    it 'should redirect the user to the next step' do
      patch :update, :id => @budget, :budget => {:income => 70000}, :section => BudgetsController::Sections.first
      response.should redirect_to budget_edit_path(@budget, :section => BudgetsController::Sections.second)
    end
  end

  describe 'DELETEdestroy' do 
    before :each do
      @user = create(:user)
      @budget = @user.budgets.create
      controller.stub(:current_user).and_return(@user) 
    end

    it "deletes the budget" do 
      expect{
        delete :destroy, id: @budget
      }.to change(Budget,:count).by(-1)
    end

    it "redirects to root_url" do
      delete :destroy, id: @budget 
      expect(response).to redirect_to root_url
    end 
  end

end
