class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def require_user
    if session[:user_id].nil?
      redirect_to(:new_session)
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
