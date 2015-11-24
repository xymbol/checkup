require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert places(:one).valid?
  end
end
