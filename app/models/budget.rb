class Budget < ActiveRecord::Base

  def translate_state_to_tax
    0.45
  end

  def income_after_taxes_calc
    income_after_taxes = income * (1-translate_state_to_tax)
    income_after_taxes.save
  end

end
