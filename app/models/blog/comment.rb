module Blog
  class Comment < ApplicationRecord
    belongs_to :article, foreign_key: 'blog_article_id'
    validates_presence_of :text
  end
end
