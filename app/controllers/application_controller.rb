class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :auth?, :current_auth_provider, :current_auth_name

  def auth?
    session.has_key? :auth_hash
  end

  def current_auth_provider
    ActiveSupport::StringInquirer.new current_auth_hash['provider']
  end

  def current_auth_name
    current_auth_hash['info']['name']
  end

  def current_auth_hash
    session[:auth_hash]
  end
end
