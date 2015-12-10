require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "show redirects when signed out" do
    get :show, id: places(:one)
    assert_redirected_to root_url
  end

  test "show" do
    authenticate
    get :show, id: places(:one)
    assert_response :ok
  end

  test "show assigns place" do
    authenticate
    get :show, id: places(:one)
    assert_equal places(:one), assigns(:place)
  end

  test "show renders form" do
    authenticate
    get :show, id: places(:one)
    assert_select 'form button[name=value][value=ok]'
    assert_select 'form button[name=value][value=not]'
  end

  test "index redirects when signed out" do
    get :index
    assert_redirected_to root_url
  end

  test "index" do
    authenticate
    get :index
    assert_response :ok
  end

  test "index assigns places" do
    authenticate
    get :index
    assert assigns(:places).include?(places(:one))
  end

  test "checked redirects when signed out" do
    get :checked
    assert_redirected_to root_url
  end

  test "checked" do
    authenticate
    get :checked
    assert_template "index"
    assert_response :ok
  end

  test "checked assigns places" do
    authenticate
    get :checked
    assert assigns(:places).include?(places(:one))
    refute assigns(:places).include?(places(:three))
  end

  test "ok when signed out" do
    get :ok
    assert_redirected_to root_url
  end

  test "ok" do
    authenticate
    get :ok
    assert_template "index"
    assert_response :ok
  end

  test "ok assigns places" do
    authenticate
    get :ok
    assert assigns(:places).include?(places(:one))
    refute assigns(:places).include?(places(:two))
  end

  test "not when signed out" do
    get :not
    assert_redirected_to root_url
  end

  test "not" do
    authenticate
    get :not
    assert_template "index"
    assert_response :ok
  end

  test "not assigns places" do
    authenticate
    get :not
    refute assigns(:places).include?(places(:one))
    assert assigns(:places).include?(places(:two))
  end
end
