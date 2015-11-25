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

  test "get index when signed out" do
    get :index
    assert_response :redirect
  end

  test "get index" do
    authenticate
    get :index
    assert_response :success
  end

  test "get checked when signed out" do
    get :checked
    assert_response :redirect
  end

  test "get checked" do
    authenticate
    get :checked
    assert_response :success
  end
end
