require 'test_helper'

class CounterTest < ActiveSupport::TestCase
  test "computes users count" do
    assert_equal 3, counter.users
  end

  test "computes checks count" do
    assert_equal 3, counter.checks
  end

  test "computes places count" do
    assert_equal 3, counter.places
  end

  test "computes checked places count" do
    assert_equal 2, counter.checked_places
  end

  %i(ok not).each do |name|
    test "computes #{name} places count" do
      assert_equal 1, counter.send("#{name}_places")
    end
  end

  test "computes progress" do
    assert_in_delta 0.667, counter.progress
  end

  test "does not compute progress with no places" do
    Check.delete_all
    Place.delete_all
    assert_nil counter.progress
  end

  test "computes ok checks" do
    assert_equal 2, counter.ok_checks
  end

  test "computes not checks" do
    assert_equal 1, counter.not_checks
  end

  def counter
    @counter ||= Counter.new
  end
end
