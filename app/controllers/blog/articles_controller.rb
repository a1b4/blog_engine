require_dependency 'blog/application_controller'

module Blog
  class ArticlesController < ApplicationController
    def index
      render json: Article.all.to_json
    end

    def create
      @article = Article.new(article_params)
      return errors_response(@article) unless @article.save

      render json: @article.to_json
    end

    def update
      @article = Article.find_by_id(params[:id])
      return not_found_response('Article') unless @article

      if @article.update(article_params)
        render json: @article.to_json
      else
        errors_response(@article)
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

      book = RubyXL::Workbook.new
      worksheet = book.worksheets[0]
      worksheet.sheet_name = 'Article'
      @article.write_workbook(worksheet)

      file = Tempfile.new(["article_#{@article.id}.xlsx", '.xlsx'])
      book.write(file.path)
      send_file file.path
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :author_id)
    end
  end
end
