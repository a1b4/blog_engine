require 'test_helper'

module Blog
  class CommentTest < ActiveSupport::TestCase
    test 'valid comment' do
      comment = blog_comments(:valid)
      assert comment.valid?
    end

    test 'invalid comment' do
      comment = blog_comments(:invalid)
      refute comment.valid?
      assert_not_nil comment.errors[:text]
    end
  end
end
