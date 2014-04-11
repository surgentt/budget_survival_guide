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

  describe "POST #create" do
    it "redirect to the budget edit path" do 
      post :create, budget: attributes_for(:budget)
      expect(response).to redirect_to budget_edit_path(assigns[:budget])
    end
  end

end
