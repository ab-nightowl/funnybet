class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :choices, dependent: :destroy
  accepts_nested_attributes_for :choices

  validates :title, :finish_at, presence: true
end
