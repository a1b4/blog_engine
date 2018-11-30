require_dependency 'blog/application_controller'

module Blog
  class ArticlesController < ApplicationController
    def index
      render json: Article.all.to_json
    end

    def create
      @article = Article.new(article_params)
      return errors_response unless @article.save

      render json: @article.to_json
    end

    def update
      @article = Article.find_by_id(params[:id])
      return not_found_response unless @article

      if @article.update(article_params)
        render json: @article.to_json
      else
        errors_response
      end
    end

    def destroy
      @article = Article.find_by_id(params[:id])
      return not_found_response unless @article

      @article.destroy
      head :no_content
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :author_id)
    end

    def errors_response
      render json: { errors: @article.errors }, status: :bad_request
    end

    def not_found_response
      render json: { error: 'Article does not exist' }, status: :not_found
    end
  end
end
