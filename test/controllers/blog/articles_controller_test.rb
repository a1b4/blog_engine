require 'test_helper'

module Blog
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
      @article = blog_articles(:valid)
    end

    test 'should get index' do
      get articles_url
      assert_response :success
    end

    test 'should post create' do
      article = { title: 'title', content: 'content', author_id: 1 }
      post articles_url, params: { article: article }
      assert_response :success
    end

    test 'post create should return errors' do
      article = { title: 'title' }
      post articles_url, params: { article: article }
      assert_response :bad_request
    end

    test 'should post update' do
      article_updates = { title: 'new article title' }
      patch article_url(@article.id), params: { article: article_updates }
      assert_response :success
    end

    test 'post update should return errors' do
      article_updates = { title: nil }
      patch article_url(@article.id), params: { article: article_updates }
      assert_response :bad_request
    end

    test 'post update should return not found' do
      article_updates = { title: 'new article title' }
      patch article_url(10), params: { article: article_updates }
      assert_response :not_found
    end
  end
end
