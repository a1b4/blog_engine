module Blog
  class Article < ApplicationRecord
    has_many :comments, dependent: :destroy, foreign_key: 'blog_article_id'
    validates_presence_of :title, :content, :author_id

    def write_workbook(sheet)
      add_row(sheet, %w[ID Title Content Author], 0)
      add_row(sheet, [id, title, content, author_id], 1)
      add_row(sheet, %w[Comments], 3)
      add_row(sheet, %w[id parent text], 4)
      comments.each_with_index do |comment, index|
        add_row(sheet, [comment.id, comment.parent_id, comment.text], index + 5)
      end
    end

    def add_row(sheet, values, row_num)
      values.each_with_index do |value, index|
        sheet.add_cell(row_num, index, value)
      end
    end
  end
end
