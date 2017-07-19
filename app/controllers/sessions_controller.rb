class SessionsController < ApplicationController

  def new
  end

  def create
    #have username and password
    #find user from db w/ username from params
    @user = User.find_by(username: params[:session][:username])
    #check users password against hash in db
    # if pword correct
    if @user.authenticate(params[:session][:password])
      #set a session
      session[:user_id] = @user.id
      flash[:notice] = "Successful login"
      #successful flash message
      #redirect user
      redirect_to @user
    else
      #if pword incorrect
    end
      #
  end

  def destroy
    session[:user_id] = nil
    #or session.clear
    flash[:notice] = "Goodbye"
    redirect_to root_path
  end

end
