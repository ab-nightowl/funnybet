class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.string :title
      t.boolean :winning
      t.references :bet, foreign_key: true

      t.timestamps
    end
  end
end
