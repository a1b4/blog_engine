module Blog
  class Article < ApplicationRecord
    has_many :comments, dependent: :destroy, foreign_key: 'blog_article_id'
    validates_presence_of :title, :content, :author_id

    def write_workbook(book)
      book.add_worksheet(name: 'Article') do |sheet|
        sheet.add_row %w[ID Title Content Author]
        sheet.add_row [id, title, content, author_id]
      end
    end
  end
end
