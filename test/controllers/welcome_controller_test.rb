require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "redirects with https" do
    request.env["HTTPS"] = "on"
    get :index
    assert_response :redirect
  end

  test "redirects when signed in" do
    authenticate
    get :index
    assert_response :redirect
  end

  test "get index renders counters" do
    get :index
    assert_select "ul.counter" do
      assert_select "li.progress_as_percentage"
    end
  end
end
