class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:show]

  def show
    user = User.find(params[:id])
    @bets = Bet.where(user: user) + UserChoice.where(user: user).map { |user_choice| user_choice.choice.bet }
  end


  private



  def find_user
    @user = User.find(params[:id])
  end




  def user_params
  params.require(:user).permit(:user_name, :photo)
  end


end
