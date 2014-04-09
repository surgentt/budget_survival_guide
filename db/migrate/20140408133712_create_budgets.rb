class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :income
      t.integer :healthcare
      t.string  :state
      t.integer :income_after_taxes
      t.integer :housing
      t.integer :cable_internet
      t.integer :utilities
      t.integer :laundry
      t.integer :commute
      t.integer :food
      t.integer :debt_service
      t.integer :investing
      t.integer :emergency
      t.integer :disposable_income

      t.timestamps
    end
  end
end
