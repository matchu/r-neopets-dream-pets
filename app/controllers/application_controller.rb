class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_signed_in?, :current_user

  def user_signed_in?
    session.has_key? :user_id
  end

  def current_user
    User.find session[:user_id]
  end
end
