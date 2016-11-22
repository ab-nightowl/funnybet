class CreateBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.datetime :finish_at
      t.string :proof
      t.string :challenge_title
      t.text :challenge

      t.timestamps
    end
  end
end
