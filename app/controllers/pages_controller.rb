class PagesController < ApplicationController

  def home
    signed_in? && @budgets = current_user.budgets
  end

  def about
  end
  
end
