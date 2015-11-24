class User < ActiveRecord::Base
  has_many :checks

  validates_presence_of :provider, :uid, :nickname
  validates_uniqueness_of :provider, scope: :uid

  def self.from_omniauth(auth)
    where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
      user.nickname = auth["info"]["nickname"]
      user.name = auth["info"]["name"]
    end
  end

  def display_name
    '@' + nickname.downcase
  end

  def to_auth
    auth = attributes.slice("provider", "uid")
    auth["info"] = attributes.slice("nickname", "name")
    auth
  end
end
