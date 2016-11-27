class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_user, only: [:show]

  def show
  end


  private

  def find_user
    @user = User.find(params[:id])
  end


  def product_params
  params.require(:product).permit(:name, :description, :photo)
  end


end
