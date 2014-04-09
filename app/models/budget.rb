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

  ## Decorators
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

end
