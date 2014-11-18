class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def post_params
  params.require(:user).permit(:email, :first_name, :last_name, :description, :picture)
  end

end
