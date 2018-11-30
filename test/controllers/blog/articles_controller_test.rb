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
  end
end
