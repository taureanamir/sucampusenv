require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @article = articles(:one)
  end

  test "should get new" do
    sign_in(users(:one))
    get new_article_path
    assert_response :success
  end

  test "should create article" do
    sign_in(users(:one))
    assert_difference('Article.count') do
      post articles_path, params: { article: { title: 'Article 1',
                                               content: 'Article Content 1',
                                               uploaded_date: @article.uploaded_date,
                                               is_published: @article.is_published } }
    end
    assert_redirected_to articles_path
  end

  test "should not create article" do
    sign_in(users(:one))
    assert_difference('Article.count', +1) do
      post articles_path, params: { article: { title: @article.title,
                                               content: @article.content,
                                               uploaded_date: @article.uploaded_date,
                                               is_published: @article.is_published } }
    end
    assert_redirected_to articles_path
  end


  test "should get edit approved" do
    sign_in users(:one)
    get edit_article_path(@article),  params: {status: 'Approved', is_published: true, updated_at: Time.now}
    assert_equal "Approved", 'Approved'
    assert_redirected_to sucampusenv_articles_list_path
  end
  test "should get edit rejected" do
    sign_in users(:one)
    get edit_article_path(@article),  params: {status: 'Rejected', is_published: false, updated_at: Time.now}
    assert_equal "Rejected", 'Rejected'
    assert_redirected_to sucampusenv_articles_list_path
  end

  test "should show article" do
    sign_in(users(:one))
    # user = users(:two)
    get article_url(@article.id)
    assert_response :success
  end
  test "should show article for memeber" do
    sign_in(users(:two))
    # user = users(:two)
    get article_url(@article.id)
    assert_response :success
  end

  test "should show article for non-memeber" do
    # user = users(:two)
    get article_url(@article.id)
    assert_response :success
  end

end