require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert users(:john).valid?
  end
end
