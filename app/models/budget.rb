class Budget < ActiveRecord::Base
  belongs_to :user

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
    self.income.present? && self.income / 12
  end

  def income_after_taxes_in_months
    self.income.present? && self.state.present? && self.income_after_taxes_calc / 12
  end

  def disposable_income_calc
    if self.housing.present? && self.cable_internet.present? && self.utilities.present? && self.laundry.present? && self.laundry.present? && self.commute.present? && self.food.present? && self.debt_service.present? && self.investing.present? && self.emergency.present?
      self.disposable_income = income_after_taxes_in_months - self.housing - self.cable_internet  - self.utilities - self.laundry - self.commute - self.food - self.debt_service - self.investing - self.emergency
      self.save
      self.disposable_income
    end
  end

  def emergency_yearly
    self.emergency.present? && self.emergency * 12
  end

  def self.median(column)
    array = self.pluck(column).compact
    sorted = array.sort
    len = sorted.length
    return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end

  def median_difference(column)
    if self.send(column).present?
      (self.send(column).to_i - Budget.median(column)).to_i
    end
  end

  def median_difference_monthly_adj(column)
    if self.send(column).present?
      median_difference(column) / 12
    end
  end

end
