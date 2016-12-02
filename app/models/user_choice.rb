class UserChoice < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  validates :choice, :user, presence: true


  def bet
    choice.bet
  end
end
