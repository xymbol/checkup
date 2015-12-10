class User < ActiveRecord::Base
  has_many :checks

  validates_presence_of :provider, :uid, :name
  validates_uniqueness_of :provider, scope: :uid
  validate :has_nickname_or_email

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.nickname = auth.info.nickname
      user.save!
    end
  end

  def display_name
    name
  end

  def to_auth
    auth = OmniAuth::AuthHash.new attributes.slice("provider", "uid")
    auth.info = attributes.slice("name", "nickname", "email")
    auth
  end

  private

  def has_nickname_or_email
    unless nickname.present? || email.present?
      errors.add :base, :must_have_nickname_or_email
    end
  end
end
