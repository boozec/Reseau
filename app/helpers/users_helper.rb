module UsersHelper
  def signup(v)
    ip = request.remote_ip
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
    startcode = (0...50).map { o[rand(o.length)] }.join

    return v["nickname"]
  end
end
