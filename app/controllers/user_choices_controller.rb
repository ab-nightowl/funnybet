class UserChoicesController
  before_action :find_bet, only: [:create]

  def create
    UserChoice.new
  end

  private

  def find_bet
    @bet = Bet.find(params[:id])
  end
end
