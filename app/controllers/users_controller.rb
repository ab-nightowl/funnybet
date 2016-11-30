class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:show]

  def show
    user = User.find(params[:id])
    @bets = Bet.where(user: user) + UserChoice.where(user: user).map { |user_choice| user_choice.choice.bet }

    @user_choices = Bet.where(user: user).map { |bet| bet.user.user_choices }.flatten

    @bet_choices = Bet.where(user: user).map { |bet| bet.choices }.flatten
  end

  def ranking
    @user = User.first
    @rank = User.all(:order => "starting_amount").index(@user)
  end


  private



  def find_user
    @user = User.find(params[:id])
  end




  def user_params
  params.require(:user).permit(:user_name, :photo)
  end


end
