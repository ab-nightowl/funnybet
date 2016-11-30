class ChoicesController < ApplicationController

  def gains
    choice = Choice.find(params[:id])
    amount = params[:bet_amount].to_i
    render json: { gains:  choice.gain(amount) }
  end
end
