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
      return not_found_response('Article') unless @article

      if @article.update(article_params)
        render json: @article.to_json
      else
        errors_response
      end
    end

    def destroy
      @article = Article.find_by_id(params[:id])
      return not_found_response('Article') unless @article

      @article.destroy
      head :no_content
    end

    def export
      @article = Article.find_by_id(params[:id])
      return not_found_response('Article') unless @article

      axlsx = Axlsx::Package.new
      book = axlsx.workbook
      @article.write_workbook(book)

      file = Tempfile.new(["article_#{@article.id}", 'xlsx'])
      axlsx.serialize(file.path)
      send_file file.path
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :author_id)
    end

    def errors_response
      render json: { errors: @article.errors }, status: :bad_request
    end

  end
end
