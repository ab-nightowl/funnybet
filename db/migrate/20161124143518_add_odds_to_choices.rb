class AddOddsToChoices < ActiveRecord::Migration[5.0]
  def change
    add_column :choices, :odds, :float
  end
end
