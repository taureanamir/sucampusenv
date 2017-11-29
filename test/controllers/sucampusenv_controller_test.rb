require 'test_helper'

class SucampusenvControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get home" do
    get sucampusenv_home_url
    assert_response :success
  end

end
