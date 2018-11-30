require 'test_helper'

module Blog
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @article = blog_articles(:valid)
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
  end
end
