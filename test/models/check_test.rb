require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  %i(ok not other).each do |name|
    test "fixture #{name} is valid" do
      assert checks(name).valid?
    end
  end

  test "search existing" do
    check = Check.search users(:john), places(:one)
    assert_equal checks(:ok), check
    assert check.persisted?
  end

  test "search non-existing returns new record" do
    check = Check.search users(:jane), places(:two)
    assert_nil check.value
    assert check.new_record?
  end

  test "search non-existing associations" do
    check = Check.search users(:jane), places(:two)
    assert_equal users(:jane), check.user
    assert_equal places(:two), check.place
  end
end
