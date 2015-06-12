class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :auth?, :current_auth_hash

  def current_auth_hash
    session[:auth_hash]
  end

  def auth?
    session.has_key? :auth_hash
  end
end
