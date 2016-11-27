class UsersController < ApplicationController

  def show
  end


  private

  def product_params
  params.require(:product).permit(:name, :description, :photo)
end

end
