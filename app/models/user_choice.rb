class UserChoice < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :choice, :user, :bet_amount, presence: true
end
