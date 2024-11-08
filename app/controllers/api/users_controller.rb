class Api::UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  private

  def users_params
    params.require(:user).permit(:id)
  end
end
