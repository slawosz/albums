class SessionController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(:albums)
    else
      redirect_to(:new_session)
    end
  end
end
