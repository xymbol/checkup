require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  %i(one two three).each do |name|
    test "#{name} is valid" do
      assert places(name).valid?
    end
  end

  test "returns ids" do
    assert_equal 3, Place.ids.length
  end

  test "finds places with ok checks" do
    assert_equal [places(:one)], Place.ok
  end

  test "finds places with not ok checks" do
    assert_equal [places(:two)], Place.not
  end

  test "sets code on create" do
    other = Place.create url: "http://example.com/"
    assert_match /\h{32}/, other.code
  end

  test "returns checked places" do
    assert_equal 2, Place.checked.count
  end

  test "returns title" do
    assert_equal "010010001_0001", places(:one).title
  end

  test "returns was checked" do
    assert places(:one).checked?
  end

  test "returns was not checked" do
    refute places(:three).checked?
  end
end
