require 'spec_helper'

describe BudgetsController do

  updated_attributes = {
    :income => 72000
  }

  describe "GET #home" do 
    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end
  end

  describe "GET #edit" do
    it "renders the :edit template" do 
      budget = create(:budget)
      get :edit, :section => "income"
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    it "redirect to the budget edit path" do 
      post :create, budget: attributes_for(:budget)
      expect(response).to redirect_to budget_edit_path(assigns[:budget])
    end
  end

  describe "PUT update" do
    it 'should redirect the user to the next step' do
      create(:budget)
      put :update, :budget => updated_attributes, :section => BudgetsController::Sections.first
      response.should redirect_to budget_edit_path(:section => BudgetsController::Sections.second)
    end
  end

end
