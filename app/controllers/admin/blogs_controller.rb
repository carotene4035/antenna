class Admin::BlogsController < ApplicationController
  def index
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blogs_params)
  end

  private
  def blogs_params
    params.require(:blog).permit(
      :name, 
      :link, 
      :description, 
      :latest_entry_published_at,
      :rss_link
    )
  end
end


