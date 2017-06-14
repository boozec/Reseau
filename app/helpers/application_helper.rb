module ApplicationHelper
  #funzione che controlla se l'utente è connesso o meno
  def check_conn
    if cookies[:user] then
      return true
    else
      return false
    end
  end

  def logout
    return cookies.delete :user
  end

  #funzione che esegue una query SQL
  def query_exe(sql)
    return ActiveRecord::Base.connection.execute(sql)
  end
end
