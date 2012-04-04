class SessionsController < ApplicationController
  include SessionsHelper
  
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    #session[:user_id] = nil 
    reset_session
    sign_out
    redirect_to root_path
  end
end
