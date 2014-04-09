class Budget < ActiveRecord::Base

  def translate_state_to_tax
    if self.state != nil
      0.30
    end
  end

  def income_after_taxes_calc
    if self.income != nil && self.state != nil
      self.income_after_taxes = self.income * (1 - translate_state_to_tax)
      self.save
      self.income_after_taxes
    end
  end

  def income_in_months
    if self.income != nil
      self.income / 12
    end
  end

  def income_after_taxes_in_months
    if self.income != nil && self.state != nil
      self.income_after_taxes_calc / 12
    end
  end

  def disposable_income_calc
    if self.housing != nil && self.cable_internet != nil && self.utilities != nil && self.laundry != nil && self.laundry != nil && self.commute != nil && self.food != nil && self.debt_service != nil && self.investing != nil && self.emergency != nil
      self.disposable_income = income_after_taxes_in_months - self.housing - self.cable_internet  - self.utilities - self.laundry - self.commute - self.food - self.debt_service - self.investing - self.emergency
      #binding.pry
      self.save
      self.disposable_income
    end
  end

end
