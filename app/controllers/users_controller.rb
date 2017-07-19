class UsersController < ApplicationController

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    flash[:message] = "Successful login"
    redirect_to user_path @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
