class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.references :blog_article, foreign_key: true
      t.text :text
      t.integer :parent_id

      t.timestamps
    end
  end
end
