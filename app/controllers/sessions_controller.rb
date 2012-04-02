class SessionsController < ApplicationController
  include SessionsHelper
  def new
      user = User.new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    #check = user.authenticate(params[:session][:email])
    #flash[:error] = check
    if user #&& user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      session[:user_id] = user.id
      sign_in user
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    flash[:notice] = 'logged out' # Not quite right!
    sign_out
    redirect_to root_path
  end
end
