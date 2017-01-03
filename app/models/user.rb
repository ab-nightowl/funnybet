class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter]

  has_many :bets, dependent: :destroy
  has_many :user_choices, dependent: :destroy

  has_attachment :photo

  validates :user_name, presence: true, uniqueness: true

  def self.usernames
    [
      "robert",
      "pipo",
      "yaslamenace",
      "jared",
      "hatchoum",
      "rocky",
      "marinedu",
      "chacal",
      "bolossdu",
      "bgdu"
    ]
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user_params[:user_name] = usernames.sample + rand(100).to_s

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
    points = 0

    winnings_choices = UserChoice.joins(:user, :choice).where(user: self).where(choices: { winning: true })
    winnings_choices.each do |winning_choice|
      points += (winning_choice.choice.gain(winning_choice.bet_amount) - winning_choice.bet_amount)
    end

    losing_choices = UserChoice.joins(:user, :choice).where(user: self).where(choices: { winning: false })
    losing_choices.each do |losing_choice|
      points -= losing_choice.bet_amount
    end

    p = points.to_i + starting_amount.to_i
    p > 0 ? p : 0
  end

  def winning_choices
    UserChoice.joins(:user, :choice).where(user: self).where(choices: { winning: true })
  end

  def losing_choices
    UserChoice.joins(:user, :choice).where(user: self).where(choices: { winning: false })
  end

  def losing
  end

  def winnings
    Choice.joins(user_choices: :user).where(choices: { winning: true }).where(user_choices: { user: self })
  end

  def losings
    Choice.joins(user_choices: :user).where(choices: { winning: false }).where(user_choices: { user: self })
  end

  def percentage_off
    return 0 unless user_choices.any?
    ((winnings.count.fdiv(user_choices.count)) * 100).round
  end

  # def winning_bets
  #   bet_ids = winnings.pluck(:bet_id)
  #   Bet.find(bet_ids)
  # end

end
