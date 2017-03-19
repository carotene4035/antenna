class AddLastEntryInsertedAtToBlogs < ActiveRecord::Migration
  def change
      add_column :blogs, :latest_article_datetime, :int
  end
end
