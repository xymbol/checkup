require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "redirects when signed in" do
    authenticate
    get :index
    assert_response :redirect
  end
end
