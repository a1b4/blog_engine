module Blog
  class Article < ApplicationRecord
    validates_presence_of :title, :content, :author_id
  end
end
