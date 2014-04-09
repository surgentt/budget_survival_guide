class Budget < ActiveRecord::Base

  def translate_state_to_tax
    0.45
  end

  def income_after_taxes_calc
    if self.income != nil
      self.income_after_taxes = self.income * (1 - translate_state_to_tax)
      self.save
      self.income_after_taxes
    end
  end

end
