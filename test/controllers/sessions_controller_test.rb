require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "get create with auth redirects" do
    set_auth_to users(:john).to_auth
    get :create, provider: "twitter"
    assert_response :redirect
  end

  test "get create with auth sets session" do
    set_auth_to users(:jane).to_auth
    get :create, provider: "twitter"
    assert_equal users(:jane).id, session[:user_id]
  end

  def set_auth_to(auth)
    request.env["omniauth.auth"] = auth
  end
end
