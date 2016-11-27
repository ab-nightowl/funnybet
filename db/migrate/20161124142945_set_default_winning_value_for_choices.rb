class SetDefaultWinningValueForChoices < ActiveRecord::Migration[5.0]
  def change
    change_column :choices, :winning, :boolean, default: false, null: false
  end
end
