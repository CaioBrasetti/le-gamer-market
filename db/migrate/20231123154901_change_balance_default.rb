class ChangeBalanceDefault < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :balance, :float, default: 100
  end
end
