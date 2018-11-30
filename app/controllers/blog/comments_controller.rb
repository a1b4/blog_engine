require_dependency 'blog/application_controller'

module Blog
  class CommentsController < ApplicationController
    def index
      @article = Article.find_by_id(params[:article_id])
      return not_found_response('Article') unless @article

      render json: @article.comments.to_json
    end

    def create
      @article = Article.find_by_id(params[:article_id])
      return not_found_response('Article') unless @article

      @comment = @article.comments.create(comment_params)
      if @comment.valid?
        render json: @article.to_json
      else
        errors_response(@comment)
      end
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end
  end
end
