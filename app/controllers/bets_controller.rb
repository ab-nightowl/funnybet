class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :new, :create]
  before_action :find_bet, only: [:show, :edit, :update]

  def index
    @bets = Bet.all
  end

  def show
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = current_user.bets.new(bet_params)
    if @bet.save
      flash[:notice] = "Ton pari a été créé"
      redirect_to bet_path(@bet)
    else
      flash[:alert] = "Ton pari n'est pas créé"
      render @bet
    end
  end

  def edit
  end

  def update
  end


  private

  def find_bet
    @bet = Bet.find(params[:id])
  end

  def bet_params
    params.require(:bet).permit(:title, :description, :challenge_title, :challenge, :finish_at)
  end

  def choice_params
    params.require(:choice).permit(:title)
  end
end
