class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redIfConn
    redirect_to root_path
  end
  helper_method :redIfConn
end
