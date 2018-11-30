require 'test_helper'

module Blog
  class ArticleTest < ActiveSupport::TestCase
    test 'valid article' do
      article = blog_articles(:valid)
      assert article.valid?
    end

    test 'invalid article title' do
      article = blog_articles(:invalid_title)
      refute article.valid?
      assert_not_nil article.errors[:title]
    end

    test 'invalid article content' do
      article = blog_articles(:invalid_content)
      refute article.valid?
      assert_not_nil article.errors[:content]
    end

    test 'invalid article author' do
      article = blog_articles(:invalid_author)
      refute article.valid?
      assert_not_nil article.errors[:author]
    end
  end
end
