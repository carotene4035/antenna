class RenameBlogsLatest < ActiveRecord::Migration
  def change
      rename_column :blogs, :latest_article_datetime, :latest_entry_published_at
  end
end
