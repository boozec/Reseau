class User < ApplicationRecord
  def self.getAvatar(id)
    if File.exist?("app/assets/images/avatars/#{id}.jpg")
        return "assets/avatars/#{id}.jpg"
    else
      return "assets/avatar.jpg"
    end
  end
end
