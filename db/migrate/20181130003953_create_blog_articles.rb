class CreateBlogArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :content
      t.integer :author_id

      t.timestamps
    end
  end
end
