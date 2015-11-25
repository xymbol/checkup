class SessionsController < ApplicationController
  skip_before_filter :authorize, only: %i(create failure)

  def create
    user = User.from_omniauth env["omniauth.auth"]
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in"
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Signed out"
  end

  def failure
    redirect_to root_url, alert: "Authentication Error"
  end
end
