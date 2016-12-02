class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:show]

  def show
    created_bets_and_played_bets
    user_choices
    bet_choices
    @choices = @user.user_choices
    @winning_choices = @user.winning_choices
    @losing_choices = @user.losing_choices
    @ranking_users = User.order(:starting_amount).reverse
  end

  def created_bets_and_played_bets
    @bets = Bet.where(user: @user) + UserChoice.where(user: @user).map { |user_choice| user_choice.choice.bet }
  end

  def user_choices
    @user_choices = Bet.where(user: @user).map { |bet| bet.user.user_choices }.flatten
  end

  def bet_choices
    @bet_choices = Bet.where(user: @user).map { |bet| bet.choices }.flatten
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
    params.require(:user).permit(:user_name, :photo, :starting_amount)
  end


end
