require "securerandom"
require "uri"

class Place < ActiveRecord::Base
  has_many :checks

  validates_presence_of :url
  validates_uniqueness_of :url, :code

  before_create :set_code

  def self.checked
    joins(:checks).distinct
  end

  def self.random_code
    codes.sample
  end

  def self.codes
    @codes ||= pluck(:code)
  end

  %i(ok not).each do |name|
    define_singleton_method name do
      joins(:checks).merge(Check.send(name)).distinct
    end
  end

  alias_attribute :to_param, :code

  def title
    File.basename(path, File.extname(path))
  end

  def path
    URI.parse(url).path
  end

  def checked?
    checks.any?
  end

  private

  def set_code
    self.code = SecureRandom.hex
  end
end
