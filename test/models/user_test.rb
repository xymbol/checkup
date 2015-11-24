require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert users(:one).valid?
  end
end
