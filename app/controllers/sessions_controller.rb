class SessionsController < ApplicationController
  # External services redirect to the callback, sometimes with a POST,
  # but they don't know the authenticity token. So, don't check.
  protect_from_forgery except: :create

  def create
    session[:auth_hash] = auth_hash
    redirect_to root_path
  end

  def destroy
    # TODO: protect from forgery?
    session.delete :auth_hash
    redirect_to root_path
  end

  def index
    # Auth debug method for development
    @current_auth_hash = current_auth_hash
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
