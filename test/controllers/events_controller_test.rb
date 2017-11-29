require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @event = events(:one)
  end

  test "should show events" do
    get events_path(@event)
    assert_response :success
  end

  test "should show event" do
    sign_in(users(:one))
    get event_path(@event)
    assert_response :success
  end
end
