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

  #funzione che converte una query SQL con le virgolete
  def query_quote(sql)
    return ActiveRecord::Base.connection.quote(sql)
  end

  # funzione che restituisce il valore di un parametro dell'utente
  # es: " userd 'id' " -> 1
  def userd(param)
    if check_conn
      t = User.where(id: cookies[:user]).take
      return t[param]
    else
      return nil
    end
  end
end
