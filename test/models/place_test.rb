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

  test "sets code on create" do
    other = Place.create url: "http://example.com/"
    assert_match /\h{32}/, other.code
  end
end
