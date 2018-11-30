require_dependency 'blog/application_controller'

module Blog
  class CommentsController < ApplicationController
    def index
      @article = find_article
      return not_found_response('Article') unless @article

      render json: @article.comments.to_json
    end

    def create
      @article = find_article
      return not_found_response('Article') unless @article

      @comment = @article.comments.create(comment_params)
      if @comment.valid?
        render json: @comment.to_json
      else
        errors_response(@comment)
      end
    end

    def destroy
      @article = find_article
      return not_found_response('Article') unless @article

      @comment = @article.comments.find_by_id(params[:id])
      return not_found_response('Comment') unless @comment

      @comment.destroy
      head :no_content
    end

    def reply
      @article = find_article
      return not_found_response('Article') unless @article

      @parent = @article.comments.find_by_id(params[:id])
      return not_found_response('Comment') unless @parent

      @comment = @parent.replies.create comment_params
      @comment.article = @article
      return errors_response(@comment) unless @comment.save

      render json: @comment.to_json
    end

    private

    def comment_params
      params.require(:comment).permit(:text)
    end

    def find_article
      Article.find_by_id(params[:article_id])
    end
  end
end
