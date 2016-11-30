class UserChoicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @bet = Bet.find(params[:bet_id])

    if user_choice_params[:choice]
      @choice = Choice.find(user_choice_params[:choice])

      if @bet.user == current_user
        @choice.set_as_winning!
        flash[:notice] = "Ton choix a bien été validé"
        redirect_to @bet
      else
        @user_choice = @bet.user_choices.create(choice: @choice, bet_amount: user_choice_params[:bet_amount])
        flash[:notice] = "Ton pari a bien été enregistré"
        redirect_to @bet
      end

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
