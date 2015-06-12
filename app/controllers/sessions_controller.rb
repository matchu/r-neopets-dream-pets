class SessionsController < ApplicationController
  # External services redirect to the callback, sometimes with a POST,
  # but they don't know the authenticity token. So, don't check.
  protect_from_forgery except: :create

  def create
    user = User.from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    # TODO: protect from forgery?
    session.delete :user_id
    redirect_to root_path
  end

  def index
    # Auth debug method for development
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
