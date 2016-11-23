class Choice < ApplicationRecord
  belongs_to :bet
  has_many :user_choices, dependent: :destroy
end
