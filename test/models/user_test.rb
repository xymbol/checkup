require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert users(:john).valid?
  end

  test "honors nickname case" do
    user = User.new nickname: "EdPMB"
    assert_equal "@EdPMB", user.display_name
  end
end
