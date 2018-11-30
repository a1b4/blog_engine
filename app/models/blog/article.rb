module Blog
  class Article < ApplicationRecord
    has_many :comments, dependent: :destroy, foreign_key: 'blog_article_id'
    validates_presence_of :title, :content, :author_id

    def write_workbook(book)
      book.add_worksheet(name: 'Article') do |sheet|
        sheet.add_row %w[ID Title Content Author]
        sheet.add_row [id, title, content, author_id]
        sheet.add_row []
        sheet.add_row %w[Comments]
        sheet.add_row %w[id parent text]
        comments.each do |comment|
          sheet.add_row [comment.id, comment.parent_id, comment.text]
        end
      end
    end
  end
end
