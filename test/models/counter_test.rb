require 'test_helper'

class CounterTest < ActiveSupport::TestCase
  setup do
    @instance = Counter.new
  end

  attr_reader :instance

  test "computes users count" do
    assert_equal 3, instance.users
  end

  test "computes checks count" do
    assert_equal 3, instance.checks
  end

  test "computes places count" do
    assert_equal 3, instance.places
  end

  test "computes checked places count" do
    assert_equal 2, instance.checked_places
  end

  test "computes progress" do
    assert_in_delta 0.667, instance.progress
  end

  test "computes ok checks" do
    assert_equal 2, instance.ok_checks
  end

  test "computes not checks" do
    assert_equal 1, instance.not_checks
  end
end
