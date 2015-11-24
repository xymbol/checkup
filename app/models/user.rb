class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.nickname = auth["info"]["nickname"]
      user.name = auth["info"]["name"]
    end
  end

  def to_auth
    auth = attributes.slice("provider", "uid")
    auth["info"] = attributes.slice("nickname", "name")
    auth
  end
end
