class AddDefaultMachinValueToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :starting_amount, :integer, default: 100
  end
end
