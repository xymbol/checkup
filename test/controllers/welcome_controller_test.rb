require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :ok
  end

  test "index redirects with https" do
    request.env["HTTPS"] = "on"
    get :index
    assert_redirected_to protocol: "http"
  end

  test "index renders counters" do
    get :index
    assert_select "ul.counter li", 3
  end

  test "index redirects when signed in" do
    authenticate
    get :index
    assert_response :redirect
  end

  test "index when user not found" do
    session[:user_id] = "xxx"
    get :index
    assert_nil assigns(:current_user)
  end
end
