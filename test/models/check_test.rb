require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  test "fixture is valid" do
    assert checks(:one).valid?
  end
end
