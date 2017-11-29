require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
  end

  test "should create comment" do
    sign_in(users(:one))
    assert_difference('comments.count') do
      get new_event_comment_url(@comment.event_id), params: { comment: { content: @comment.content,
                                                                          user_id: @comment.user_id,
                                                                          event_id: @comment.event_id
      } }
    end
    assert_redirected_to new_event_comment_url(comment.last)
  end

  test "should authenticate create comment" do
    sign_in(users(:one))
    assert_difference('comments.count', 0) do
      get new_event_comment_url(@comment.event_id), params: { comment: { content: @comment.content,
                                              user_id: @comment.user_id,
                                              event_id: @comment.event_id
      } }
    end
    assert_redirected_to new_user_session_path
  end
end
