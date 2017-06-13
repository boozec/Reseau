module ApplicationHelper
  #funzione che controlla se l'utente è connesso o meno
  def check_conn
    unless cookies[:user] then
      return 'Non connesso'
    else
      return 'Connesso'
    end
  end

  #funzione che esegue una query SQL
  def query_exe(sql)
    return ActiveRecord::Base.connection.execute(sql)
  end
end
