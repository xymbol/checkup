require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get create" do
    request.env["omniauth.auth"] = users(:john).to_auth
    get :create, provider: "twitter"
    assert_response :redirect
  end
end
