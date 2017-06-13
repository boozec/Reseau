class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def query_exe(sql)
    return ActiveRecord::Base.connection.execute(sql)
  end
  helper_method :query_exe
end
