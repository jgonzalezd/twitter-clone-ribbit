class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #This is a security issue but for this purpose I will allow it.
      redirect_to user, notice: "Logged in!" 
    else
      flash[:error] = "Incorrect User/Password combination"
      redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have logged out."
  end
end
