require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: places(:one)
    assert_response :redirect
  end

  test "should get ok" do
    patch :ok, id: places(:one)
    assert_response :redirect
  end

  test "should get not" do
    patch :not, id: places(:one)
    assert_response :redirect
  end
end
