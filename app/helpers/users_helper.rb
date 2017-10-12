module UsersHelper
  require 'digest/md5'

  def signup(v)
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    startcode = (0...50).map { o[rand(o.length)] }.join
    pass = Digest::MD5.hexdigest(v["password"])

    unless User.select(:id).where(:username => v["username"]).count > 0
      unless User.select(:id).where(:email => v["email"]).count > 0
        begin
          query_exe("INSERT INTO users(id, username, password, email, rank, reg_ip, last_ip, startcode, created_at, updated_at)
          VALUES (NULL,'#{v["username"]}','#{pass}','#{v["email"]}','0','#{ip}','#{ip}','#{startcode}','#{date}','#{date}')")
          newID = query_exe("SELECT id FROM users ORDER BY id DESC LIMIT 1")
          newID.each do |r|
            newID = r[0]
          end
          cookies[:user] = {:value => newID, :expires => Time.now() + 3600}
          redIfConn
        rescue
          return 'Errore'
        end
      else
        return 'Email già in uso'
      end
    else
      return 'Username già in uso'
    end
  end


  def signin(v)
    pass = Digest::MD5.hexdigest(v["password"])

    unless User.select(:id).where(:username => v["username"]).count == 0
      unless User.select(:id).where(:username => v["username"], :password => pass).count == 0
        unless User.select(:id).where(:rank => -1).count == 1
          begin
            query_exe("UPDATE users SET last_ip = '#{ip}', updated_at = '#{date}' WHERE username = '#{v["username"]}'")
            userID = query_exe("SELECT id FROM users WHERE username = '#{v["username"]}'")
            userID.each do |r|
              userID = r[0]
            end
            cookies[:user] = {:value => userID, :expires => Time.now() + 3600}
            redIfConn
          rescue
            return 'Errore'
          end
        else
          return 'Utente bannato'
        end
      else
        return 'Password sbagliata'
      end
    else
      return 'Utente non esistente'
    end
  end

end
