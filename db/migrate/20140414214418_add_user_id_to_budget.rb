class AddUserIdToBudget < ActiveRecord::Migration
  def change
    add_column :budgets, :user_id, :intger
  end
end
