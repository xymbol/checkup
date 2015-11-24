class Place < ActiveRecord::Base
  has_many :checks

  validates_presence_of :url

  def self.random_id
    ids.sample
  end

  def self.ids
    @ids ||= pluck(:id)
  end
end
