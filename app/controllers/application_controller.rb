class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redIfConn
    redirect_to root_path
  end
  helper_method :redIfConn

  def ip
    return request.remote_ip
  end
  helper_method :ip

  def date
    d = DateTime.now
    return d.strftime("%Y-%m-%d %H:%M:%S")
  end
  helper_method :date
end
