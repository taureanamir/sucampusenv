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

  test "should get new" do
    sign_in(users(:one))
    get new_event_path
    assert_response :success
  end

  test "should validate get new" do
    sign_in(users(:two))
    get new_event_path
    assert_redirected_to events_path
  end

  test "should get edit" do
    sign_in(users(:one))
    get edit_event_path(@event)
    assert_response :success
  end

  test "should authenticate get edit" do
    sign_in(users(:two))
    get edit_event_path(@event)
    assert_redirected_to events_url
  end

  test "should create event" do
    sign_in users(:one)
    assert_difference('Event.count', 1) do
      post events_url, params: { event: { title: @event.title,
                                          description: @event.description,
                                 event_date: @event.event_date,
                                 event_time: @event.event_time,
                                 contact: @event.contact} }
    end
    assert_redirected_to event_path(Event.last)
  end


  test "should authenticate create event" do
    sign_in(users(:two))
    assert_difference('Event.count', 0) do
      post events_url, params: { event: { title: @event.title,
                                          description: @event.description,
                                          event_date: @event.event_date,
                                          event_time: @event.event_time,
                                          contact: @event.contact} }
    end
    assert_redirected_to events_path
  end


  test "should destroy event" do
    sign_in(users(:one))
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end
    assert_redirected_to events_path
  end

  test "should validate destroy event" do
    sign_in(users(:two))
    assert_difference('Event.count', 0) do
      delete event_url(@event)
    end
    assert_redirected_to events_path
  end

  test "should update event" do
    sign_in(users(:one))
    patch event_url(@event), params: { event: { title: 'Updated Title',
                                                 description: @event.description,
                                                 event_date: @event.event_date,
                                                 event_time: @event.event_time,
                                                 contact: @event.contact} }
    assert_redirected_to event_url(@event)
  end

  test "should validate update event" do
    sign_in(users(:two))
    patch event_url(@event), params: { event: { title: 'Updated Title',
                                                description: @event.description,
                                                event_date: @event.event_date,
                                                event_time: @event.event_time,
                                                contact: @event.contact} }
    assert_redirected_to events_url
  end
end
