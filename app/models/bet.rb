class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :choices

  validates :title, :finish_at, :description, presence: true
end
