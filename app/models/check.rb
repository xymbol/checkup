class Check < ActiveRecord::Base
  belongs_to :user
  belongs_to :place

  validates_presence_of :user
  validates_presence_of :place
  validates_presence_of :value
  validates_inclusion_of :value, in: %w(ok not)
  validates_uniqueness_of :place_id, scope: :user_id
end
