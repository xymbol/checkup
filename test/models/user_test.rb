require 'test_helper'

class UserTest < ActiveSupport::TestCase
  %i(john jane richard).each do |name|
    test "fixture #{name} is valid" do
      assert users(name).valid?
    end
  end

  test "is invalid without nickname or email" do
    user = users(:john)
    user.email = user.nickname = nil
    user.valid?
    refute user.errors[:base].empty?
  end

  test "sets email on auth" do
    auth = build_auth
    auth.info.email = "name@example.com"
    user = User.from_omniauth auth
    assert_equal "name@example.com", user.email
  end

  test "updates email on auth" do
    auth = users(:jane).to_auth
    auth.info.email = "jane@example.com"
    user = User.from_omniauth auth
    assert_equal "jane@example.com", user.email
  end

  test "returns auth" do
    assert_instance_of OmniAuth::AuthHash, users(:john).to_auth
  end

  def build_auth
    OmniAuth::AuthHash.new \
      provider: "provider", uid: 123, info: { name: "Name" }
  end
end
