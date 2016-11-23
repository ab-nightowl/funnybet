class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :choices, dependent: :destroy

  validates :title, :finish_at, presence: true
end
