require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "progress_as_percentage" do
    assert_equal "66,67%", progress_as_percentage
  end

  test "progress_as_percentage with no progress" do
    Check.delete_all
    Place.delete_all
    assert_equal "N/D", progress_as_percentage
  end

  def counter
    @counter ||= Counter.new
  end
end
