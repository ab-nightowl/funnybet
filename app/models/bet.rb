class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :choices, inverse_of: :bet, dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  has_many :user_choices, through: :choices

  validates :title, :finish_at, presence: true
  validates :choices, length: { minimum: 2, message: "Tu dois proposer au moins 2 choix de réponses" }
  validates :category_id, presence: true
end
