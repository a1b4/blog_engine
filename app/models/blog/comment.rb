module Blog
  class Comment < ApplicationRecord
    belongs_to :article, foreign_key: 'blog_article_id'
    has_many :replies, class_name: 'Comment', foreign_key: 'parent_id',
      dependent: :destroy
    validates_presence_of :text
  end
end
