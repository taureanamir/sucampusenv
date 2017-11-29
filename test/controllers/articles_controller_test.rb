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
    assert_redirected_to articles_url
  end

  test "should not create article" do
    sign_in(users(:one))
    assert_difference('Article.count', +1) do
      post articles_path, params: { article: { title: @article.title,
                                               content: @article.content,
                                               uploaded_date: @article.uploaded_date,
                                               is_published: @article.is_published } }
    end
    assert_redirected_to articles_url
  end

  test "should show article" do
    sign_in(users(:one))
    get articles_url
    assert_response :success
  end
end
