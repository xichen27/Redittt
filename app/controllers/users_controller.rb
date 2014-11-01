class UsersController < ApplicationController
  before_action :require_user, only: [:show]
    
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
