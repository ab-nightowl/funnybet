class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.date :birthdate
      t.integer :starting_amount
      t.integer :rank
    end
  end
end
