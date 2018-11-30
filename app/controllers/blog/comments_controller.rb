require_dependency 'blog/application_controller'

module Blog
  class CommentsController < ApplicationController
    def index
      @article = Article.find_by_id(params[:article_id])
      return not_found_response('Article') unless @article

      render json: @article.comments.to_json
    end
  end
end
