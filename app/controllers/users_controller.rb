class UsersController < ApplicationController
  #before_filter :signed_in_user, only: [:index, :edit, :update]
  #before_filter :correct_user,   only: [:edit, :update]
  include SessionsHelper
  
  def new
     @user = User.new
  end
  
  def show
    @user = current_user
    @books = @user.books
  end
  
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
        format.html { redirect_to @user, notice: 'you was successfully signed up.' }
      else
        format.html { render action: "new" }
      end
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
