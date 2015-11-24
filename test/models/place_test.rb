require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert places(:one).valid?
  end

  test "returns ids" do
    assert_equal 3, Place.ids.length
  end
end
