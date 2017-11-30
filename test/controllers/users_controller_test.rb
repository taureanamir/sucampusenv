require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:one)
    get users_path
    assert_response :success
  end

  test "should validate get index" do
    sign_in users(:two)
    get users_path
    assert_response :success
  end


end
