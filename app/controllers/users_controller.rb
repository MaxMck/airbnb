class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:email, :first_name, :last_name, :description, :picture)
  end

end
