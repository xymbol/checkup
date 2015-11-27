require 'test_helper'

class Api::PlacesControllerTest < ActionController::TestCase
  test "get ok" do
    get :ok
    assert_response :success
  end

  test "get ok responds with text" do
    get :ok
    assert_match %r(text/plain), response.headers["Content-Type"]
  end

  test "get ok responds with lines" do
    get :ok
    assert_equal [places(:one).pdf_url], response.body.split("\n")
  end
end
