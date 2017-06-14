module UsersHelper
  require 'digest/md5'
  def signup(v)
    ip = request.remote_ip
    d = DateTime.now
    date = d.strftime("%Y-%m-%d %H:%M:%S")
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    startcode = (0...50).map { o[rand(o.length)] }.join
    pass = Digest::MD5.hexdigest(v["password"])

    unless User.select(:id).where(:nickname => v["nickname"]).count > 0
      unless User.select(:id).where(:email => v["email"]).count > 0
        begin
          query_exe("INSERT INTO users(id, nickname, password, email, rank, reg_ip, last_ip, startcode, created_at, updated_at)
          VALUES (NULL,'" + v["nickname"] + "','" + pass + "','" + v["email"] + "','0','" + ip + "','" + ip + "','" + startcode + "','" + date + "','" + date + "')")
          cookies[:user] = {:value => v["nickname"], :expires => Time.now() + 3600}
          return 'Ok'
        rescue
          return 'Errore'
        end
      else
        return 'Email già in uso'
      end
    else
      return 'Nickname già in uso'
    end
  end
end
