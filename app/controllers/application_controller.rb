class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :require_user
  
  def login!(user)
    self.session[:session_token] = user.reset_session_token!
    redirect_to user_url(user)
  end
  
  def logout
    current_user.reset_session_token!
    self.session[:session_token] = nil
    redirect_to new_session_url
  end
  
  def current_user
    @current_user = User.find_by(session_token: self.session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    redirect_to new_session_url unless logged_in?
  end
  
end
