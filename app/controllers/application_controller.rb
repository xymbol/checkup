class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    nil
  end
  helper_method :current_user

  def authorize
    unless current_user
      redirect_to root_url, alert: "Not Authorized"
    end
  end
end
