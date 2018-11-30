require 'test_helper'

module Blog
  class ArticlesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @routes = Engine.routes
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

    test 'should post create return errors' do
      article = { title: 'title' }
      post articles_url, params: { article: article }
      assert_response :bad_request
    end
  end
end
