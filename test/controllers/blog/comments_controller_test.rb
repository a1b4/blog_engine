require 'test_helper'

module Blog
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @article = blog_articles(:valid)
      @comment = blog_comments(:valid)
    end

    test 'should get index' do
      get article_comments_url(@article.id)
      assert_response :success
    end

    test 'get index should return not found' do
      get article_comments_url(10)
      assert_response :not_found
    end

    test 'should post create' do
      comment = { text: 'my new comment' }
      post article_comments_url(@article.id), params: { comment: comment }
      assert_response :success
    end

    test 'post create should return errors' do
      comment = { text: nil }
      post article_comments_url(@article.id), params: { comment: comment }
      assert_response :bad_request
    end

    test 'post create should return not found' do
      comment = { text: 'my new comment' }
      post article_comments_url(10), params: { comment: comment }
      assert_response :not_found
    end

    test 'should destroy' do
      delete article_comment_url(@comment.article.id, @comment.id)
      assert_response :success
    end

    test 'destroy should return not found article' do
      delete article_comment_url(10, @comment.id)
      assert_response :not_found
    end

    test 'destroy should return not found comment' do
      delete article_comment_url(@comment.article.id, 10)
      assert_response :not_found
    end
  end
end
