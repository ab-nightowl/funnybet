class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :find_bet, only: [:show]

  def index
    @bets = Bet.all
  end

  def show
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_param)
    if @bet.save
    else
      render @bet
    end
  end

  def edit
  end

  def update
    @bet.update
  end


  private

  def find_bet
    @bet = Bet.find(params[:id])
  end

  def user_bet
    @bet = Bet.find(params[:user_id])
  end

  def bet_params
    params.require(:bet).permit(:user, :tilte)
  end



end
