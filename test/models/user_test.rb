require 'test_helper'

class UserTest < ActiveSupport::TestCase
  %i(john jane).each do |name|
    test "fixture #{name} is valid" do
      assert users(name).valid?
    end
  end

  test "honors nickname case" do
    user = User.new nickname: "EdPMB"
    assert_equal "@EdPMB", user.display_name
  end
end
