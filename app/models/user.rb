class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bets, dependent: :destroy
  has_many :user_choices, dependent: :destroy

  validates :user_name, presence: true, uniqueness: true
end
