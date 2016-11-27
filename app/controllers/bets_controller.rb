class BetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :find_bet, only: [:show, :edit, :update]

  def index
    @bets = Bet.all
  end

  def show
  end

  def new
    @bet = Bet.new
    @bet.choices << Choice.new << Choice.new
    @bet.choices.each do |choice|
      @bet_choice_id = choice.id
    end
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
    params.require(:bet).permit(:title, :description, :challenge_title, :challenge, :finish_at, choices_attributes: [:title, :_destroy])
  end
end
