require 'test_helper'

class ChecksControllerTest < ActionController::TestCase
  test "update redirects when signed out" do
    patch :update, place_id: places(:three), value: "ok"
    assert_redirected_to root_url
  end

  test "update assigns place" do
    authenticate
    patch :update, place_id: places(:three), value: "ok"
    assert_equal places(:three), assigns(:place)
  end

  test "update assigns check" do
    authenticate
    patch :update, place_id: places(:one), value: "not"
    assert_equal checks(:ok), assigns(:check)
  end

  test "update assigns value" do
    authenticate
    patch :update, place_id: places(:one), value: "not"
    assert_equal "not", assigns(:check).value
  end

  test "update for new check creates check" do
    authenticate
    assert_difference "Check.count" do
      patch :update, place_id: places(:three), value: "ok"
    end
  end

  test "update for existing check does not create check" do
    authenticate
    assert_no_difference("Check.count") do
      patch :update, place_id: places(:one), value: "not"
    end
  end

  test "update redirects" do
    authenticate
    patch :update, place_id: places(:three), value: "ok"
    assert_redirected_to root_url
  end
end
