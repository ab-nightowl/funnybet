class UserChoicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @bet = Bet.find(params[:bet_id])

    if user_choice_params[:choice]
      @choice = Choice.find(user_choice_params[:choice])
      @user_choice = UserChoice.create(choice: @choice, bet_amount: user_choice_params[:bet_amount], user: current_user)
      flash[:notice] = "Ton pari a bien été enregistré"
      redirect_to @bet
    else
      flash[:alert] = "Erreur : ton pari n'est pas pris en compte "
      @user_choice = UserChoice.new
      render 'bets/show'
    end
  end

  private

  def user_choice_params
    params.require(:user_choice).permit(:choice, :bet_amount)
  end
end
