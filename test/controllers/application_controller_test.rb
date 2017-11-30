require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    @user3 = users(:three)
  end

  test "should get after_sign_in_path_for" do
    sign_in(users(:one))
    get user_path(@user.id)
    assert_response :success
  end

  test "should get after_sign_in_path_for 2" do
    sign_in(users(:three))
    get user_path(@user3.id)
    assert_response :success
  end


end