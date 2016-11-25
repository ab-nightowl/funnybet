class Category < ApplicationRecord
  has_many :bets

  def slug
    name.parameterize
  end
end
