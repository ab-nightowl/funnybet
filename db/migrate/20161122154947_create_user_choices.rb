class CreateUserChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :user_choices do |t|
      t.integer :bet_amount
      t.references :user, foreign_key: true
      t.references :choice, foreign_key: true

      t.timestamps
    end
  end
end
