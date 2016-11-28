class UserChoicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    byebug
    @user_choice = current_user.bets.user_choices.new(bet_params)

    # créer le use choice
    redirect_to @user_choice.choice.bet
  end
end
