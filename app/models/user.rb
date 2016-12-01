class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :bets, dependent: :destroy
  has_many :user_choices, dependent: :destroy

  has_attachment :photo

  validates :user_name, presence: true, uniqueness: true

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def points
    winning_choices = UserChoice.joins(:user, :choice).where(user: self).where(choices: { winning: true })
    points = 0
    winning_choices.each do |winning_choice|
      points += (winning_choice.choice.gain(winning_choice.bet_amount) - winning_choice.bet_amount)
    end
    p = points.to_i - starting_amount.to_i
    p > 0 ? p : 0
  end

  def winnings
    Choice.joins(user_choices: :user).where(choices: { winning: true }).where(user_choices: { user: self })
  end

  def losings
    Choice.joins(user_choices: :user).where(choices: { winning: false }).where(user_choices: { user: self })
  end

  def percentage_off
    ((winnings.count.fdiv(user_choices.count)) * 100).round
  end
end
