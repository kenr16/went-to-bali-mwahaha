#Sessions controller is used for creating and destroying sessions, ie: logging in and logging out.
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Thank you for signing in!"
      redirect_to '/'
    else
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Thank you for signing out!"
    redirect_to '/sign_in'
  end

end
