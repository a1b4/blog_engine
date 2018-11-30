require_dependency 'blog/application_controller'

module Blog
  class ArticlesController < ApplicationController
    def index
      render json: Article.all.to_json
    end

    def create
      @article = Article.new(article_params)
      return render json: { errors: @article.errors }, status: :bad_request unless @article.save

      render json: @article.to_json
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :author_id)
    end
  end
end
