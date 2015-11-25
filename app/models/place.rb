class Place < ActiveRecord::Base
  has_many :checks

  validates_presence_of :url
  validates_uniqueness_of :url, :code

  before_create :set_code

  def set_code
    self.code = SecureRandom.hex
  end

  def to_param
    code
  end

  def self.random_code
    codes.sample
  end

  def self.codes
    @codes ||= pluck(:code)
  end
end
