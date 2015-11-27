class Counter < ActiveRecord::Base
  validates_presence_of \
    :users,
    :checks,
    :places,
    :checked_places,
    :ok_places,
    :not_places,
    :progress,
    :ok_checks,
    :not_checks

  scope :recent, -> { order(id: :desc) }

  def initialize(*)
    super
    compute_counts
    compute_progress
    compute_checks
  end

  private

  def compute_counts
    self.users = User.count
    self.checks = Check.count
    self.places = Place.count
    self.checked_places = Place.checked.count
    self.ok_places = Place.ok.count
    self.not_places = Place.not.count
  end

  def compute_progress
    self.progress = checked_places.to_f / places
  end

  def compute_checks
    self.ok_checks = Check.ok.count
    self.not_checks = Check.not.count
  end
end
