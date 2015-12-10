require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "create with auth redirects" do
    set_auth_to users(:john).to_auth
    get :create, provider: "twitter"
    assert_response :redirect
  end

  test "create with auth sets session" do
    set_auth_to users(:jane).to_auth
    get :create, provider: "twitter"
    assert_equal users(:jane).id, session[:user_id]
  end

  test "destroy" do
    authenticate
    get :destroy
    assert_nil session[:user_id], "session not empty"
    assert_redirected_to root_url
  end

  test "failure" do
    get :failure
    assert_redirected_to root_url
  end

  def set_auth_to(auth)
    request.env["omniauth.auth"] = auth
  end
end
