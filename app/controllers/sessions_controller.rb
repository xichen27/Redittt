class SessionsController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])
    
    if @user.nil?
      render :new
    else
      login!(@user)
    end
  end
  
  def destroy
    logout
  end
  
end
