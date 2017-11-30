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

  test "should create user" do
    assert_difference('Event.count', 0) do
      post events_url, params: { event: { title: @event.title,
                                          description: @event.description,
                                          event_date: @event.event_date,
                                          event_time: @event.event_time,
                                          contact: @event.contact} }
    end
    assert_redirected_to events_path
  end


end
