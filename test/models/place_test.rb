require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  %i(one two three four).each do |name|
    test "#{name} is valid" do
      assert places(name).valid?
    end
  end

  test "returns codes" do
    assert_equal 3, Place.codes.length
  end

  test "finds places with ok checks" do
    assert_equal [places(:one)], Place.ok
  end

  test "finds places with not ok checks" do
    assert_equal [places(:two)], Place.not
  end

  test "sets code on validation" do
    place = Place.new url: "http://example.com/"
    place.valid?
    assert_match /\h{32}/, place.code
  end

  test "excludes places without telegram" do
    assert Place.all.exclude?(places(:four))
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

  test "returns pdf url" do
    assert_equal \
      "http://www.resultados.gob.ar/bltgetelegr/01/001/0001/010010001_0001.pdf",
      places(:one).pdf_url
  end

  test "does not return pdf url without telegram" do
    assert_nil places(:four).pdf_url
  end
end
