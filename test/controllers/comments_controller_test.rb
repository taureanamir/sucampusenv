require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
  end

  test "should authenticate create comment" do
    sign_in users(:one)
    assert_difference('Comment.count', 1) do
      post event_comments_url(@comment.event_id), params: { comment: { content: @comment.content,
                                                       user_id: @comment.user_id,
                                                       event_id: @comment.event_id
      } }
    end
    assert_redirected_to event_path(@comment.event)
  end

end
