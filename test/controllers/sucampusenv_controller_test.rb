require 'test_helper'

class SucampusenvControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get home" do
    get sucampusenv_home_url
    assert_response :success
  end

  test "admin should see participents list" do
    sign_in(users(:one))
    get sucampusenv_participants_list_path
    assert_response :success
  end

  test "unthenticated users should not see participents list" do
    sign_in(users(:two))
    get sucampusenv_participants_list_path
    assert_response :success
  end

  test "admin should see list of users' articles" do
    sign_in users(:one)
    get sucampusenv_articles_list_path
    assert_response :success
  end

  test "member should should not see others articles" do
    sign_in users(:two)
    get sucampusenv_articles_list_path
    assert_redirected_to articles_path
  end

  test "member should see their articles status" do
    sign_in users(:two)
    get sucampusenv_my_articles_path(@article)
    assert_response :success
  end

  test "should set member" do
    @member = User.find(users(:two).id)
  end

end
