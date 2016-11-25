class Choice < ApplicationRecord
  belongs_to :bet, inverse_of: :choices
  has_many :user_choices, dependent: :destroy

  validates :title, presence: true
  # validates :odds
end
