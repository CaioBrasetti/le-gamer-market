class RemoveBalanceFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :balance, :decimal
  end
end
