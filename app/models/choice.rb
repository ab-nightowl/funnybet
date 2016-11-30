class Choice < ApplicationRecord
  belongs_to :bet, inverse_of: :choices
  has_many :user_choices, dependent: :destroy

  validates :title, presence: true

  attr_writer :position

  def odd
    total_amount = 0
    choice_amount = 0
    bet.user_choices.each { |user_choice| total_amount += user_choice.bet_amount }
    self.user_choices.each { |user_choice| choice_amount += user_choice.bet_amount }
    odd = (1 - choice_amount.to_f / total_amount) * 4 + 1

    odd.nan? ? 1 : odd
  end

  def gain(amount)
    total_amount = amount
    choice_amount = amount
    bet.user_choices.each { |user_choice| total_amount += user_choice.bet_amount }
    self.user_choices.each { |user_choice| choice_amount += user_choice.bet_amount }
    odd = (1 - choice_amount.to_f / total_amount) * 4 + 1
    (odd * amount).round(2)
  end
end
