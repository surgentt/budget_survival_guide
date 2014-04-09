class Budget < ActiveRecord::Base

  def translate_state_to_tax
    0.45
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

  def disposable_income
    self.disposable_income = self.income_after_taxes 
                            - ((self.housing * 12) 
                            + (self.cable_internet * 12) 
                            + (self.utilities * 12) 
                            + (self.laundry * 12) 
                            + (self.commute * 12) 
                            + (self.food * 12) 
                            + (self.debt_service * 12) 
                            + (self.investing * 12) 
                            + (self.emergency * 12))
  end

  def monthly_disposable_income
    self.disposable_income / 12
  end

end
