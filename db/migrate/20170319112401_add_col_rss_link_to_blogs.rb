class AddColRssLinkToBlogs < ActiveRecord::Migration
  def change
      add_column :blogs, :rss_link, :string, :after =>:link
  end
end
